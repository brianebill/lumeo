class Comment < ActiveRecord::Base
  attr_accessible :text, :photo
  belongs_to :post
  has_attached_file :photo, :default_url => "default_:style_photo.png",
                    :styles => { :show => ["150x150#", :png ],
                                 :feed => ["50x50#", :png ],
                                 :header => ["15x15#", :png ]},
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => 'lumeo-user-dev'
end