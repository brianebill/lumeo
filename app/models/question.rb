class Question < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :tag_ids, :tags_attributes
  
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :description,  :presence => true
  
  belongs_to :user
  has_many :comments
  has_many :tags, :dependent => :destroy, :as => :parent
  
  accepts_nested_attributes_for :tags, allow_destroy: true
  
  include PgSearch
  pg_search_scope :search, against: [:title, :description],
     using: {tsearch: {dictionary: "english"}},
       associated_against: {user: :name},
       ignoring: :accents

  def self.question_search(query)
    if query.present?
      search(query)
      where("title @@ :q or description @@ :q", q: query)
    else
      scoped
    end
  end
end
