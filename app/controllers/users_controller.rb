class UsersController < ApplicationController
  skip_before_action :require_user, except: [:show]
  skip_before_action :require_admin

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
       UserNotifier.send_signup_email(@user).deliver_now
      redirect_to dashboard_path
    else
      flash.now[:notice] = "Invalid Username or Password"
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name)
  end
end
