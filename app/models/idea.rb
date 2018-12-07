class Idea < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, 
                  :subject, :image_attributes, :tags_attributes, :tag_ids
  
  belongs_to :user
  has_one :image, :as => :parent, :dependent => :destroy
  accepts_nested_attributes_for :image, :allow_destroy => true
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags, allow_destroy: :true,
                                :reject_if => :all_blank
  
  votable_by :users
  
  after_create do
    self.create_image unless image
  end
  
  include PgSearch
  pg_search_scope :search, against: [:title, :description],
     using: {tsearch: {dictionary: "english"}},
       associated_against: {user: :name},
       ignoring: :accents

  def self.idea_search(query)
    if query.present?
      search(query)
      where("to_tsvector('english', title) @@ :q 
      or to_tsvector('english', description) @@ :q", q: query)
    else
      scoped
    end
  end
end
