class Post < ActiveRecord::Base
  attr_accessible :category_id, :created_date, :edited_date, :index_text, :show_text, :title, :photo
   has_and_belongs_to_many :categories, :join_table => 'categories_posts'
    validates :title, :presence => true,
                      :length => { :minimum => 5 }

    has_many :comments, :dependent => :destroy

      default_scope order: 'posts.created_at DESC'

      has_attached_file :photo,
                        :styles => { :show => ["250x250#", :png ],
                                     :index => ["150x150#", :png ]},
                        :storage => :s3,
                        :s3_credentials => "#{Rails.root}/config/s3.yml",
                        :path => ":attachment/:id/:style.:extension",
                        :bucket => 'lumeo-post-dev'
  end
