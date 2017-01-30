require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "should get new" do
    get signup_path
    assert_response :success 
  end

  test "should get a users page" do
    get user_path(@user)
    assert_response :success
  end
end
