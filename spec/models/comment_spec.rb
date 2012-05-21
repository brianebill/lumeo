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

require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end
