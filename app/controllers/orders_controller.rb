class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    new_order = current_user.orders.create
    new_order.items << @cart.find_items
    @cart.contents.clear
    flash[:notice] = "Order Successfully Placed!"
    redirect_to orders_path
  end

  def show
    @order_number = @_request.env["REQUEST_PATH"].split("/").last
    @order = current_user.orders.find(@order_number)
  end

  def get_quantity
  end

end
