class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user), notice: 'Logged in'
    else  
      flash.now.alert = "email is invalid"
    end
  end
end
