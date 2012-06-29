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
  attr_accessible :created_date, :edited_date, :index_text, :show_text, :title, 
                  :image_attributes, :categories_attributes, :category_ids
  
  belongs_to :user
  has_many :categories
  accepts_nested_attributes_for :categories, allow_destroy: :true,
                                :reject_if => :all_blank

  has_many :comments, :as => :commentable, :dependent => :destroy
  has_one :image, :as => :parent, :dependent => :destroy
  accepts_nested_attributes_for :image, :allow_destroy => true

  validates :title, :presence => true, :length => { :minimum => 3 }
  validates :index_text, :presence => true, :length => { :minimum => 3 }
  validates :show_text, :presence => true, :length => { :minimum => 3 }

  default_scope order: 'posts.created_at DESC'

end