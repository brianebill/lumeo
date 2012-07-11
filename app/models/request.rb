class Request < ActiveRecord::Base
  # before_save do |req|
    # %w[ title who subject ].each do |type|
     # req.attributes[type] = req.attributes[type].titleize
   # end
 # end
  attr_accessible :description, :title, :user_id, :who, :tag_ids, 
                  :subject, :image_attributes, :tags_attributes, :tags
  
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :description,  :presence => true
  validates :who,  :presence => true
  
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
  pg_search_scope :search, against: [:title, :description, :who],
     using: {tsearch: {dictionary: "english"}},
       associated_against: {user: :name},
       ignoring: :accents

  def self.request_search(query)
    if query.present?
      search(query)
      where("to_tsvector('english', title) @@ :q 
            or to_tsvector('english', description) @@ :q 
            or to_tsvector('english', who) @@ :q", q: query)
    else
      scoped
    end
  end
end
