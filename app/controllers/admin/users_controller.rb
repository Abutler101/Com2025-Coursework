# Admin manager controller - inherits admin check from auth controller
class Admin::UsersController < Admin::AuthorisedController
  # Display a table of all users and key attribs, sorted by ID
  def index
    @users = User.order(id: :desc).all
  end

  # Create and store new user from given strong params
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "New user created"
      redirect_to admin_users_path
    else
      render :'admin/users/new'
    end
  end

  # Use form to gather necessary info to create a new user
  def new
    @user = User.new
  end

  # Delete a target user and all orders they've placed along with all reviews made
  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end

  private
  # A user can only take: first+last names, email, password+confirmation and if they are an admin or not as params
  # These strong params differ from the standard user controller strong params in that they allow for making users admin
  # Having a signup form that allows to make yourself an admin doesn't seem smart
  def user_params
    params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation, :admin)
  end
end
