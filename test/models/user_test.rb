require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "invalid user with no name" do
    unname_user = User.new
    unname_user.email = "example@example.com"
    unname_user.gender = "Female"
    unname_user.role = "instractor"
    unname_user.dob = "20-07-1993"

    assert unname_user.invalid?
    assert unname_user.errors['name'].any?
  end
end
