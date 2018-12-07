# == Schema Information
#
# Table name: schools
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class School < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :courses
end
