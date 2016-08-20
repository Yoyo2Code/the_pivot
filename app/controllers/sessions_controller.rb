class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = ""
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def new
  end

  def destroy
    session.clear
    flash[:success] = 'Successfully logged out!'
    redirect_to login_path
  end

end
