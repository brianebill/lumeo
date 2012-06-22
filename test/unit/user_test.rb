require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "creates image after User created" do
    u = User.create(:name => 'Bob', :email => 'bob@gmail.com', :password => 'password')
    u.reload

    assert u.image
    assert u.image.source
  end
end
