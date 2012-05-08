class Video < ActiveRecord::Base
  attr_accessible :course_id, :description, :html_embed_for_video, :running_time, :title, :user_id
end
