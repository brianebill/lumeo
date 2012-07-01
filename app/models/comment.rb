# == Schema Information
#
# Table name: comments
#
#  id                 :integer         not null, primary key
#  user_id            :integer
#  post_id            :integer
#  micropost_id       :integer
#  text               :text
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  commentable_id     :integer
#  commentable_type   :string(255)
#

class Comment < ActiveRecord::Base
  attr_accessible :text, :photo
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
end