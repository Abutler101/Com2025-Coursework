class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = t(:session_success) + "#{user.firstName}"
    else
      flash[:danger] = t(:session_failed)
    end
    redirect_to root_url
  end

  def destroy
    if curr_user.nil?
      flash[:warning] = t(:not_logged_in)
    else
      session[:user_id] = nil
      flash[:warning] = t(:logout)
    end
    redirect_to root_url
  end
end
