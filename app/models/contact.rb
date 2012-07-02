class Contact < ActiveRecord::Base
  attr_accessible :status, :subject, :message, :user_id
  
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  validates :subject, :presence => true
  validates :message,  :presence => true
  
  default_scope order: 'contacts.created_at DESC'
  
  include PgSearch
  pg_search_scope :search, against: [:subject, :message],
     using: {tsearch: {dictionary: "english"}},
       associated_against: {user: :name},
       ignoring: :accents

  def self.contact_search(query)
    if query.present?
      search(query)
      where("to_tsvector('english', subject) @@ :q or to_tsvector('english', message) @@ :q", q: query)
    else
      scoped
    end
  end
end
