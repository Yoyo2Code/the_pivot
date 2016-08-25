class Admin::OrdersController < Admin::BaseController
  def index
    @orders = current_user.business.orders
  end
end
