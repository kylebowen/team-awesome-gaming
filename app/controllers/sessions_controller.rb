class SessionsController < ApplicationController
  def new
    @user = User.find_by(params[:email])
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
    else
      flash.now[:danger] = "Incorrect email/password combination"
      render 'new'
    end
  end
end
