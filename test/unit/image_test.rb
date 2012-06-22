require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test "default path without parent" do
    img = Image.new

    assert_match %r[image/original], img.source.to_s
  end

  test "default path with parent" do
    img = Image.new
    img.parent_type = 'Course'

    assert_match %r[course/original], img.source.to_s
  end
end
