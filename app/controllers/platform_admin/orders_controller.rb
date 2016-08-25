class PlatformAdmin::OrdersController < PlatformAdmin::BaseController
  def index
    @orders = Order.all
  end
end
