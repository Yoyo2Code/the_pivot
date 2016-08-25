class PlatformAdmin::OrdersController < PlatformAdmin::BaseController
  def index
    @orders = Order.all
  end

  def show
    @orders = Order.find(params[:id])
  end
end
