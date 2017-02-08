require 'test_helper'

class ScoreboardTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    log_in_as @user
  end

  test "Scoreboard layout" do
    get scorekeeper_path
    assert_response :success
    assert_select 'img.gravatar'
  end
end
