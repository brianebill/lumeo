class Question < ActiveRecord::Base
  before_save { |question| question.title = title.titleize }
  attr_accessible :description, :title, :user_id, :subject
  
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :description,  :presence => true
  
  belongs_to :user
  has_many :comments
  
  include PgSearch
  pg_search_scope :search, against: [:title, :description, :subject],
     using: {tsearch: {dictionary: "english"}},
       associated_against: {user: :name},
       ignoring: :accents

  def self.question_search(query)
    if query.present?
      search(query)
      where("to_tsvector('english', title) @@ :q or to_tsvector('english', description) @@ :q or to_tsvector('english', subject) @@ :q", q: query)
    else
      scoped
    end
  end
end
