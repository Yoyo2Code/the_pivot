class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Account successfully created!'
      redirect_to cart_path if @cart.contents.any?
      redirect_to dashboard_path if @cart.contents.empty?
    else
      #ActiveRecord
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:success] = 'Changes to your account have been saved!'
      redirect_to dashboard_path
    else
      #ActiveRecord errors
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name)
  end
end
