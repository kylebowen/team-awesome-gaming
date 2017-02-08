require 'test_helper'

class GameplaySessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "logged in user should get new" do
    log_in_as @user
    get scorekeeper_path
    assert_response :success
  end

  test "non-logged in user should redirect to login" do
    get scorekeeper_path
    assert_redirected_to login_url
  end
end
