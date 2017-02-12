class PlaySessionsController < ApplicationController
  before_action :logged_in_user

  def new
    @user = current_user
    @play_session = PlaySession.new
    session[:current_score] ||= 0
  end

  def create
    @play_session = PlaySession.new(play_session_params)
  end

  def update
    # raise "Yay, you're finally testing the update action!"
    @user = current_user
    session[:current_score] += params[:commit].to_i
    render 'play_sessions/scoreboard'
  end

  def reset
    # raise "Yay, you're finally testing the reset action!"
    @user = current_user
    session[:current_score] = 0
    render 'play_sessions/scoreboard'
  end

  private

    def play_session_params
      params.require(:play_session).permit(:players, :game_master)
    end
end
