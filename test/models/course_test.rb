require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save course without title" do
    course = Course.new
    assert course.invalid?
    assert course.errors['title'].any?
  end
end
