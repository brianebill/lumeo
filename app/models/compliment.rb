class Compliment < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :tags_attributes, :image_attributes
  
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :description,  :presence => true
  
  votable_by :users
  
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  default_scope order: 'compliments.created_at DESC'

  include PgSearch
  pg_search_scope :search, against: [:title, :description],
     using: {tsearch: {dictionary: "english"}},
       associated_against: {user: :name},
       ignoring: :accents

  def self.compliment_search(query)
    if query.present?
      search(query)
      where("title @@ :q or description @@ :q", q: query)
    else
      scoped
    end
  end
end
