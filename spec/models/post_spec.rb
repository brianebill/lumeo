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

require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"
end
