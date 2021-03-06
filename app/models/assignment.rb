# == Schema Information
#
# Table name: assignments
#
#  id         :integer         not null, primary key
#  role_id    :integer
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :tag
  belongs_to :request
end
