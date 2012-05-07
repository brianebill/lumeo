class Category < ActiveRecord::Base
  has_and_belongs_to_many :posts, :join_table => 'categories_posts'
  attr_accessible :name
end