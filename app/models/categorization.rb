class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :post_id, :postion
  attr_accessor :enable # nice little thingy here
  belongs_to :posts
  belongs_to :categories
end
