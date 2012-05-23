# == Schema Information
#
# Table name: posts
#
#  id                 :integer         not null, primary key
#  title              :string(255)
#  index_text         :text
#  show_text          :text
#  created_date       :datetime
#  edited_date        :datetime
#  category_id        :integer
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Post < ActiveRecord::Base
  attr_accessible :created_date, :edited_date, :index_text, :show_text, :title, :photo, :category_ids
  has_many :categorizations
  accepts_nested_attributes_for :categorizations, allow_destroy: true
  has_many :categories, :through => :categorizations
  validates :title, :presence => true,
                      :length => { :minimum => 5 }

  has_many :comments, :as => :commentable, :dependent => :destroy

  default_scope order: 'posts.created_at DESC'

  has_attached_file :photo,
                        :styles => { :show => ["250x250#", :png ],
                                     :index => ["150x150#", :png ]},
                        :storage => :s3,
                        :s3_credentials => "#{Rails.root}/config/s3.yml",
                        :path => ":attachment/:id/:style.:extension",
                        :bucket => 'lumeo-post-dev'
    def initialized_categorizations # this is the key method
        [].tap do |o|
          Category.all.each do |category|
            if c = categorizations.find { |c| c.category_id == category.id }
              o << c.tap { |c| c.enable ||= true }
            else
              o << Categorization.new(category: category)
            end
          end
        end
      end
  end
