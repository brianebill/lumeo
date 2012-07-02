# == Schema Information
#
# Table name: courses
#
#  id                 :integer         not null, primary key
#  school_id          :integer
#  title              :string(255)
#  total_running_time :time
#  show_text          :text
#  index_text         :text
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  description        :text
#  price              :decimal(, )
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Course < ActiveRecord::Base
  attr_accessible :index_text, :school_id, :show_text, :title, :total_running_time, :description, 
                  :price, :image_attributes

  belongs_to :user

  has_many :videos, :dependent => :destroy
  accepts_nested_attributes_for :videos, :allow_destroy => true
  
  #image
  has_one :image, :dependent => :destroy, :as => :parent
  accepts_nested_attributes_for :image, :allow_destroy => true
  
  default_scope order: 'posts.created_at DESC'
end
