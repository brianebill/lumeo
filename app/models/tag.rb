class Tag < ActiveRecord::Base
  before_save { |tag| tag.name = name.titleize }
  attr_accessible :name, :request_id
  belongs_to :post
  belongs_to :parent, :polymorphic => true
  attr_accessible :name, :parent_id, :parent_type

  validates_uniqueness_of :name
  
  validates :request_id, :presence => true, :associated => true
  validates :name, :presence => true

end
