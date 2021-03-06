require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information should re-render page with error messages" do
    get signup_path
    assert_select 'form.new_user'
    assert_select 'input#user_name'
    assert_select 'input#user_email'
    assert_select 'input#user_password'
    assert_select 'input#user_password_confirmation'
    assert_select 'input', type: 'submit'
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    assert_select 'form[action="/signup"]'
  end

  test "valid signup information should create user and redirect to user page" do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Sample User",
                                         email: "sample@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
