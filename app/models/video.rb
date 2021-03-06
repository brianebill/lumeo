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

class Video < ActiveRecord::Base
  attr_accessible :course_id, :description, :html_embed_for_video, :running_time, :title, :user_id, :image_attributes
  
  belongs_to :course
  has_many :comments, :as => :commentable
  
  #photo
  has_one :image, :as => :parent, :dependent => :destroy
  accepts_nested_attributes_for :image, :allow_destroy => true
  has_and_belongs_to_many :tags
    accepts_nested_attributes_for :tags, allow_destroy: :true,
                                :reject_if => :all_blank
  
  after_create do
      self.create_image unless image
    end
end
