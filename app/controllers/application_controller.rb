class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_admin?

  before_action :set_cart

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def require_user
    render file: "/public/404" unless current_user && current_user.id == params[:id].to_i if params[:id]
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
