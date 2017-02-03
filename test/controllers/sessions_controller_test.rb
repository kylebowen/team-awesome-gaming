require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "can log in and out" do
    get login_path
    assert_response :success
    post login_path params: { session: { email: @user.email,
                                         password: 'password' } }
    assert_redirected_to @user
    assert is_logged_in?
    delete logout_path
    assert_redirected_to root_path
    # Simulate a user clicking logout in a second window
    delete logout_path
    follow_redirect!
    assert_not is_logged_in?
  end
end
