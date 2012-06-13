class Problem < ActiveRecord::Base
  attr_accessible :description, :status, :title, :user_id
  
  belongs_to :user
  has_many :comments
  
end
