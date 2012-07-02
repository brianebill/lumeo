class Idea < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :subject, :image_attributes
  
  belongs_to :user
  has_many :comments
  
  votable_by :users
  
  default_scope order: 'ideas.created_at DESC'
  
  include PgSearch
  pg_search_scope :search, against: [:title, :description],
     using: {tsearch: {dictionary: "english"}},
       associated_against: {user: :name},
       ignoring: :accents

  def self.idea_search(query)
    if query.present?
      search(query)
      where("to_tsvector('english', title) @@ :q or to_tsvector('english', description) @@ :q", q: query)
    else
      scoped
    end
  end
end
