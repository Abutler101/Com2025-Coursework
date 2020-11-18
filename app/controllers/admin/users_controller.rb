class Admin::UsersController < Admin::AuthorisedController
  def index
    @users = User.order(id: :desc).all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "New user created"
      redirect_to admin_users_path
    else
      render :'admin/users/new'
    end
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation, :admin)
  end
end
