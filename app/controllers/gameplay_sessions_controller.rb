class GameplaySessionsController < ApplicationController
  before_action :logged_in_user

  def new
    @user = current_user
    session[:current_score] ||= 0
  end

  def update
    @user = current_user
    session[:current_score] += params[:commit].to_i
    render 'gameplay_sessions/new'
  end

  def reset
    @user = current_user
    session[:current_score] = 0
    render 'gameplay_sessions/new'
  end
end
