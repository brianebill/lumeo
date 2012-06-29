# == Schema Information
#
# Table name: categories
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Category < ActiveRecord::Base
  before_save { |category| category.name = category.name.downcase }
  attr_accessible :name, :post_id
  validates_uniqueness_of :name, :case_sensitive => false
  belongs_to :post
end
