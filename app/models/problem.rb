class Problem < ActiveRecord::Base
  attr_accessible :description, :status, :title, :user_id
  
  belongs_to :user
  has_many :comments
  
  include PgSearch
  pg_search_scope :search, against: [:title, :description],
     using: {tsearch: {dictionary: "english"}},
       associated_against: {user: :name},
       ignoring: :accents

  def self.problem_search(query)
    if query.present?
      search(query)
      where("title @@ :q or description @@ :q", q: query)
    else
      scoped
    end
  end
end