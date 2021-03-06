class SessionsController < ApplicationController
  def new
    @user = User.find_by(params[:email])
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      if params[:session][:remember_me] == '1'
        remember(@user)
      else
        forget(@user)
      end
      redirect_back_or @user
    else
      flash.now[:danger] = "Incorrect email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
