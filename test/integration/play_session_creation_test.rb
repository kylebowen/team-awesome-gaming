require 'test_helper'

class PlaySessionCreationTest < ActionDispatch::IntegrationTest

  def setup
    @user  = users(:michael)
    @user2 = users(:archer)
  end

  test "create a new ScoreKeeper session" do
    log_in_as(@user)
    get scorekeeper_path
    assert_select 'form'
    post scorekeeper_path, params: { play_session: { game_master: @user,
                                                     players: @user2 } }
    assert_template 'play_sessions/scoreboard'
  end
end
