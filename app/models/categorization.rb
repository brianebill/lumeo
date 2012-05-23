class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :post_id, :postion
  attr_accessor :enable # nice little thingy here
  belongs_to :post
  belongs_to :category
end
