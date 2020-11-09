class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successful login - #{user.firstName}"
    else
      flash[:danger] = "Login Failled"
    end
    redirect_to root_url
  end

  def destroy
    if curr_user.nil?
      flash[:warning] = "Not logged in"
    else
      session[:user_id] = nil
      flash[:warning] = "Logged out successfully"
    end
    redirect_to root_url
  end
end
