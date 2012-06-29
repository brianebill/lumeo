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
  attr_accessible :created_date, :edited_date, :index_text, :show_text, :title, :photo, :category_ids, :image_attributes
  
  belongs_to :user
  has_many :categories

  has_many :comments, :as => :commentable, :dependent => :destroy
  has_one :image, :as => :parent, :dependent => :destroy

  validates :title, :presence => true, :length => { :minimum => 5 }

  accepts_nested_attributes_for :image, :allow_destroy => true

  default_scope order: 'posts.created_at DESC'

end