class GameplaySessionsController < ApplicationController
  before_action :logged_in_user

  def new
    @user = current_user
    session[:current_score] ||= 0
  end

  def update
    # raise "Yay, you're finally testing the update action!"
    @user = current_user
    session[:current_score] += params[:commit].to_i
    render 'gameplay_sessions/new'
  end

  def reset
    # raise "Yay, you're finally testing the reset action!"
    @user = current_user
    session[:current_score] = 0
    render 'gameplay_sessions/new'
  end
end
