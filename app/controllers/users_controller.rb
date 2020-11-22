# User account Controller - manage opening and closing of user accounts.
class UsersController < ApplicationController
  before_action :chck_session, only: [:create, :new]

  # Use a form to collect new user info. Can't already be logged in when trying to signup
  def new
    @user=User.new
  end

  # Create a new user from the strong params and save
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = t(:acc_created)
      redirect_to root_url
    else
      flash[:danger] = t(:something_wrong)
      redirect_to root_url
    end
  end

  # Close the currently logged in account - taking with it all placed orders and reviews written - right to be forgotten
  def destroy
    if curr_user.nil?
      flash[:warning] = t(:not_logged_in)
    else
      curr_user.destroy
      session[:user_id] = nil
      flash[:warning] = t(:acc_closed)
    end
    redirect_to root_url
  end

  private
  # When making a user only name, email and password + conf are acceptable params
  def user_params
    params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation)
  end
end
