class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    new_order = current_user.orders.create
    new_order.items << @cart.find_items
    redirect_to orders_path
  end

end
