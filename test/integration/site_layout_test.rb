require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "logged-out layout links" do
    get root_url
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", users_path, count: 0
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", user_path(@user), count: 0
    assert_select "a[href=?]", edit_user_path(@user), count: 0
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", "http://www.latimes.com/"
    assert_select "a[href=?]", "https://github.com/kylebowen"
  end

  test "logged-in layout links" do
    log_in_as(@user)
    assert is_logged_in?
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", "http://www.latimes.com/"
    assert_select "a[href=?]", "https://github.com/kylebowen"
  end
end
