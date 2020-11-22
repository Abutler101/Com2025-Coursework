# User session controller - manage login and logout. Must not already be logged in when logging in
class SessionsController < ApplicationController
  before_action :chck_session, only: %i[new create]

  # Gather required info via a form to login
  def new
  end

  # Using strong params validate user login and update session variable with user ID if everything is valid
  def create
    user = User.find_by_email(session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = t(:session_success) + "#{user.firstName}"
    else
      flash[:danger] = t(:session_failed)
    end
    redirect_to root_url
  end

  # Manage logging out - clear ID session variable and go home
  def destroy
    if curr_user.nil?
      flash[:warning] = t(:not_logged_in)
    else
      session[:user_id] = nil
      flash[:warning] = t(:logout)
    end
    redirect_to root_url
  end

  private
  # When logging in you should only provide an email and password
  def session_params
    params.permit(:email, :password)
  end
end
