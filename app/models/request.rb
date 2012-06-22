class Request < ActiveRecord::Base
  before_save { |request| request.title = title.titleize }
  before_save { |request| request.who = who.titleize }
  attr_accessible :description, :title, :user_id, :who, :tag_ids, :tags_attributes
  
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :description,  :presence => true
  validates :who,  :presence => true
  validates :tags, :presence => true, :associated => true 
  
  belongs_to :user
  has_many :comments
  has_many :assignments
  has_many :tags, :dependent => :destroy, :as => :parent
  
  accepts_nested_attributes_for :tags, allow_destroy: true
    #:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
  include PgSearch
  pg_search_scope :search, against: [:title, :description, :who],
     using: {tsearch: {dictionary: "english"}},
       associated_against: {user: :name},
       ignoring: :accents

  def self.request_search(query)
    if query.present?
      search(query)
      where("title @@ :q or description @@ :q or who @@ :q", q: query)
    else
      scoped
    end
  end
end
