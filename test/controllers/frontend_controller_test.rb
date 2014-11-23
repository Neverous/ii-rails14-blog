require 'test_helper'

class FrontendControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show_post" do
    get :show_post
    assert_response :success
  end

  test "should get add_comment" do
    get :add_comment
    assert_response :success
  end

end
