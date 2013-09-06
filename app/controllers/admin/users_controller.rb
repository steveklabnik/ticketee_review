class Admin::UsersController < Admin::BaseController
  def index
    @users = User.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    params = user_params.dup
    params[:password_confirmation] = params[:password]
    @user = User.new(params)

    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash.now[:alert] = "User has not been created."
      render :action => "new"
    end
  end

  private

    def user_params
      params.require(:user).permit(:name,
                                   :email,
                                   :password,
                                   :password_confirmation,
                                   :admin)
    end
end
