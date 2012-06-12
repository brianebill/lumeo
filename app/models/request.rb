class Request < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :who
  
  belongs_to :user
  has_many :comments
  
  define_index do
    indexes title, sortable: true
    indexes description
  end
  
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
