class Request < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :who
  
  belongs_to :user
  has_many :comments
  
  define_index do
    indexes title, sortable: true
    indexes description
  end
  

end
