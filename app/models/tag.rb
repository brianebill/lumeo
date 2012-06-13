class Tag < ActiveRecord::Base
  belongs_to :post
  belongs_to :request
  belongs_to :compliment
  attr_accessible :name
end
