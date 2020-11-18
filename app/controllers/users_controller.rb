class UsersController < ApplicationController
  def new
  end

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
  def user_params
    params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation)
  end
end
