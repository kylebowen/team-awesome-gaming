require 'test_helper'

class ScoreboardTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    log_in_as @user
  end

  test "Scoreboard layout" do
    skip 'Need to adjust to account for change in creation flow.'
    get scorekeeper_path
    assert_response :success
    assert_select "div.playerscore", count: 1 do
      assert_select "img.gravatar"
      assert_select "a[href=?]", user_path(@user)
      assert_select "form input", count: 9 do
        assert_select "[type=?]", 'submit', count: 5
        assert_select "[name=?]", 'utf8'
        assert_select "[name=?]", '_method'
      end
    end
  end
end
