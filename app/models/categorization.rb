class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :post_id, :postion
  belongs_to :posts
  belongs_to :categories
  attr_accessor :enable # nice little thingy here
end
