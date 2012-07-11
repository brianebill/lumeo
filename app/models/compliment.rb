class Compliment < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :tags_attributes, :image_attributes
  
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :description,  :presence => true
  
  votable_by :users
  
  belongs_to :user
  has_one :image, :as => :parent, :dependent => :destroy
  accepts_nested_attributes_for :image, :allow_destroy => true
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  after_create do
    self.create_image unless image
  end
end
