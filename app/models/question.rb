class Question < ActiveRecord::Base
  before_save { |question| question.title = title.titleize }
  attr_accessible :description, :title, :user_id, 
                  :subject, :image_attributes, :tags_attributes, :tag_ids
  
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :description,  :presence => true
  
  belongs_to :user
  has_one :image, :as => :parent, :dependent => :destroy
    accepts_nested_attributes_for :image, :allow_destroy => true
  has_and_belongs_to_many :tags
    accepts_nested_attributes_for :tags, allow_destroy: :true,
                                :reject_if => :all_blank
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  votable_by :users
  
  after_create do
    self.create_image unless image
  end
  
  include PgSearch
  pg_search_scope :search, against: [:title, :description],
     using: {tsearch: {dictionary: "english"}},
       associated_against: {user: :name},
       ignoring: :accents

  def self.question_search(query)
    if query.present?
      search(query)
      where("title @@ :q 
            or description @@", q: query)
    else
      scoped
    end
  end
end
