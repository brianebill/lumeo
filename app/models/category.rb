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
  attr_accessible :name
  belongs_to :post
  validates :name, presence: true
end
