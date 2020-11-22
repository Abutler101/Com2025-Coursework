# Base application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Wraps the session variable user id and publicises as a helper method. Returns the current logged in user object
  def curr_user
    unless session[:user_id].nil?
      @curr_user = User.find(session[:user_id])
    end
  end
  helper_method :curr_user

  private
  # Checks to see if a user is indeed logged in. If not, direct to the login screen
  def req_login
    unless curr_user
      flash[:danger] = "Login to view this content"
      redirect_to login_url
    end
  end

  # Checks to see if a user is an admin. If not then bounce them back to the home screen
  def req_admin
    unless curr_user.admin
      flash[:danger] = "You must be admin to go there!"
      redirect_to root_url
    end
  end

  # Deal with loading the cart from the user's cookies. If it's not there then just use a blank cart
  def cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  # Store updated cart in json form in the user's cookies. Will have it expire after a week of not being used.
  def update_cart(new_cart)
    cookies[:cart] ={value: JSON.generate(new_cart), expires_in: 7.days}
    cookies[:cart]
  end

  # Prevent logged in users signing up again (while still logged in)
  def chck_session
    if curr_user.present?
      flash[:warning] = "Already have an existing account"
      redirect_to root_url
    end
  end

end
