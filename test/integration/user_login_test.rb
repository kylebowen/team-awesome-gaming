require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @invalid_user = users(:invalid)
  end

  test "login page should have a login form" do
    get root_path
    assert_template 'static_pages/home'
    get login_path
    assert_template 'sessions/new'
    assert_select 'form'
    assert_select 'input#session_email'
    assert_select 'input#session_password'
    assert_select 'input', type: 'submit'
  end

  test "invalid login should re-render page with error messages" do
    log_in_as(@invalid_user)
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "valid login should work and redirect to user show page" do
    get login_path
    log_in_as(@user)
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_equal cookies['remember_token'], assigns(:user).remember_token
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: '1')
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['remember_token']
  end
end
