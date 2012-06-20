# == Schema Information
#
# Table name: courses
#
#  id                 :integer         not null, primary key
#  school_id          :integer
#  title              :string(255)
#  total_running_time :time
#  show_text          :text
#  index_text         :text
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  description        :text
#  price              :decimal(, )
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Course < ActiveRecord::Base
  attr_accessible :index_text, :school_id, :show_text, :title, :total_running_time, :description, :price, :source
  
  has_many :videos, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :videos, :allow_destroy => true
  
  has_attached_file :source,
                    :styles => { :show => ["250x250#", :png ],
                                 :index => ["150x150#", :png ]},
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => 'lumeo-course-dev'
                    
  # cancel post-processing now, and set processing flag
  before_source_post_process do
    if !processing && source_changed?
      self.processing = true
      false # halts processing
    end
  end

  # this will enqueue a Delayed Job for processing the image
  after_save do
    if source_changed?
      Delayed::Job.enqueue Course.new(self.id)
    end
  end

  # generate styles (downloads original first)
  def regenerate_styles!
    source.reprocess!

    self.processing = false
    save :validate => false
  end

  # detect if our source file has changed
  def source_changed?
    source_file_size_changed? ||
    source_file_name_changed? ||
    source_content_type_changed?
  end
end
