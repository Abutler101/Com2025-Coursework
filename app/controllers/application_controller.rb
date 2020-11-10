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
    unless curr_user
      flash[:danger] = "Login to view this content"
      redirect_to login_url
    end
  end

  def cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
    # if cookies[:cart].present?
    #   @cart = JSON.parse(cookies[:cart])
    # else
    #   @cart = {}
    # end
  end

  helper_method :cart
  def update_cart(new_cart)
    cookies[:cart] ={value: JSON.generate(new_cart), expires_in: 7.days}
    cookies[:cart]
  end

  def chck_session
    if current_user.present?
      flash[:warning] = "Already have an existing account"
      redirect_to root_url
    end
  end

end
