# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  first_name             :string(255)
#  last_name              :string(255)
#  role_id                :integer
#  photo_file_name        :string(255)
#  photo_content_type     :string(255)
#  photo_file_size        :integer
#  photo_updated_at       :datetime
#  name                   :string(255)
#

class User < ActiveRecord::Base
	rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, 
                  :remember_me, :role_id, :role_ids, :image_attributes,
                  :terms
  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false
  # attr_accessible :title, :body
  has_many :assignments
  has_many :roles, :through => :assignments
  #mcroposts
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  #user photo
  has_one :image, :dependent => :destroy, :as => :parent
  accepts_nested_attributes_for :image, :allow_destroy => true
  
  has_one :pro, :dependent => :destroy
  
  has_many :posts, :dependent => :destroy
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :requests, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  has_many :problems, :dependent => :destroy
  has_many :ideas, :dependent => :destroy
  has_many :compliments, :dependent => :destroy
  has_many :contacts, :dependent => :destroy
  has_many :courses, :dependent => :destroy
  has_many :articles, :dependent => :destroy
  has_many :books, :dependent => :destroy

  # after a user is created, make sure a Image
  # association is also created
  after_create do
    self.create_image unless image
  end

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end
  
  def feed
    Micropost.from_users_followed_by(self)
  end
  
  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
  
  def feed
    Micropost.from_users_followed_by(self)
  end
  
  votes_on :requests, :questions, :problems, :ideas, :compliments
  
end
