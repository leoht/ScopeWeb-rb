require 'test_helper'

class NoticesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get share" do
    get :share
    assert_response :success
  end

end
