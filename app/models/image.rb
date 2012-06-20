class Image < ActiveRecord::Base
  attr_accessible :source_content_type, :source_file_name, :source_file_size, :source_updated_at
  belongs_to :contact
  
    has_attached_file :source, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
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
        Delayed::Job.enqueue ImageJob.new(self.id)
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
