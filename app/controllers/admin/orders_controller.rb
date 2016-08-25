class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.
  end

  def show
    @order = Order.find(params[:id])
  end
end
