class Admin::UsersController < Admin::BaseController
  def show
    @user = current_user if current_admin?
  end
end
