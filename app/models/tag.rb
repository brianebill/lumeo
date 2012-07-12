class Tag < ActiveRecord::Base
  before_save { |tag| tag.name = name.titleize }
  attr_accessible :name
  has_and_belongs_to_many :requests
  has_and_belongs_to_many :questions
  has_and_belongs_to_many :ideas
  has_and_belongs_to_many :problems
  has_and_belongs_to_many :pros

  validates_uniqueness_of :name

end
