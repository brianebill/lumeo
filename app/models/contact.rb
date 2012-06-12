class Contact < ActiveRecord::Base
  attr_accessible :message, :status, :title, :user_id
end
