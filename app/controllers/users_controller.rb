class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Account created"
      redirect_to root_url
    else
      flash[:danger] = "Something went wrong"
      redirect_to root_url
    end
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation)
  end
end
