class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  add_flash_types :success,
                  :info,
                  :warning,
                  :danger

  before_action :set_cart, :authorize!

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorize!
    unless authorized?
      redirect_to root_url, danger: "You are not authorized to visit this page"
    end
  end

  def authorized?
    current_permission.allow?(params[:controller], params[:action])
  end
end
