# == Schema Information
#
# Table name: videos
#
#  id                   :integer         not null, primary key
#  title                :string(255)
#  description          :text
#  course_id            :integer
#  html_embed_for_video :text
#  running_time         :time
#  user_id              :integer
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  photo_file_name      :string(255)
#  photo_content_type   :string(255)
#  photo_file_size      :integer
#  photo_updated_at     :datetime
#

require 'spec_helper'

describe Video do
  pending "add some examples to (or delete) #{__FILE__}"
end
