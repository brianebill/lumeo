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
  has_attached_file :photo, :default_url => "default_:style_photo.png",
                    :styles => { :show => ["150x150#", :png ],
                                 :feed => ["50x50#", :png ],
                                 :header => ["15x15#", :png ]},
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => 'lumeo-user-dev'
end
