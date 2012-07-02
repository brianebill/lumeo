class Request < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :who, :tag_ids, 
                  :subject, :tags_attributes, :image_attributes
  
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :description,  :presence => true
  validates :who,  :presence => true
  
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_one :image, :as => :parent, :dependent => :destroy
  accepts_nested_attributes_for :image, :allow_destroy => true

  votable_by :users
  
  default_scope order: 'requests.created_at DESC'

  include PgSearch
  pg_search_scope :search, against: [:title, :description, :who, :subject],
     using: {tsearch: {dictionary: "english"}},
       associated_against: {user: :name},
       ignoring: :accents

  def self.request_search(query)
    if query.present?
      search(query)
      where("to_tsvector('english', title) @@ :q or to_tsvector('english', description) @@ :q or to_tsvector('english', subject) @@ :q", q: query)
    else
      scoped
    end
  end
end
