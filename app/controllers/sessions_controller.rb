class SessionsController < ApplicationController
  skip_before_action :require_user

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if current_admin?
        redirect_to '/admin/dashboard'
      else
        redirect_to '/dashboard'
      end
    else
      render :new
    end
  end

  def new

  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
