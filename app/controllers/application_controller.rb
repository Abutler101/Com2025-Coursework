class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def curr_user
    unless session[:user_id].nil?
      @curr_user = User.find(session[:user_id])
    end
  end
  helper_method :curr_user

  private
  def req_login
    unless current_user
      flash[:danger] = "Login to view this content"
      redirect_to login_url
    end
  end

  def chck_session
    if current_user.present?
      flash[:warning] = "Already have an existing account"
      redirect_to root_url
    end
  end

end
