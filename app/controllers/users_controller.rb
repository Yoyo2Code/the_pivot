class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Account successfully created!'
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
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name)
  end
end
