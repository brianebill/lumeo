class Request < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :who, :tags_attributes
  
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :description,  :presence => true
  validates :who,  :presence => true
  
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :tags
  
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
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
