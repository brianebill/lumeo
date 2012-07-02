class Problem < ActiveRecord::Base
  attr_accessible :description, :status, :title, :user_id, :image_attributes
  
  belongs_to :user
  has_one :image, :as => :parent, :dependent => :destroy
  accepts_nested_attributes_for :image, :allow_destroy => true
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  votable_by :users
  
  default_scope order: 'problems.created_at DESC'
  
  include PgSearch
  pg_search_scope :search, against: [:title, :description],
     using: {tsearch: {dictionary: "english"}},
       associated_against: {user: :name},
       ignoring: :accents

  def self.problem_search(query)
    if query.present?
      search(query)
      where("to_tsvector('english',title) @@ :q or to_tsvector('english', description) @@ :q", q: query)
    else
      scoped
    end
  end
end
