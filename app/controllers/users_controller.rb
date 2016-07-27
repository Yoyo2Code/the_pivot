class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash[:notice] = "Invalid Username or Password"
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
    params.require(:user).permit(:username, :password)
  end
end
