require 'test_helper'

class LecturesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @lecture = lectures(:one)
  end
  #
  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:lectures)
  # end
  #
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  #
  # test "should create lecture" do
  #   assert_difference('Lecture.count') do
  #     post :create, lecture: { attachment: @lecture.attachment, content: @lecture.content, course_id: @lecture.course_id }
  #   end
  #
  #   assert_redirected_to lecture_path(assigns(:lecture))
  # end
  #
  # test "should show lecture" do
  #   get :show, id: @lecture
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get :edit, id: @lecture
  #   assert_response :success
  # end
  #
  # test "should update lecture" do
  #   patch :update, id: @lecture, lecture: { attachment: @lecture.attachment, content: @lecture.content, course_id: @lecture.course_id }
  #   assert_redirected_to lecture_path(assigns(:lecture))
  # end
  #
  # test "should destroy lecture" do
  #   assert_difference('Lecture.count', -1) do
  #     delete :destroy, id: @lecture
  #   end
  #
  #   assert_redirected_to lectures_path
  # end

  #test case on add_new_comment
  test "should post comment" do
    sign_in(User.all.first)
    post :add_new_comment, id: @lecture , comment: {comment: 'test' , user_id: User.all.first.id}
    assert_redirected_to @lecture
    sign_out(User.all.first)
  end

  #test case on delete_comment
  test "should delete comment" do
    sign_in(User.all.first)
    assert_difference('Comment.count' , -1) do
      delete :delete_comment, id: @lecture , comment: {comment: 'test' , id: Comment.all.first.id }
      assert_redirected_to @lecture
    end
    sign_out(User.all.first)
  end

end
