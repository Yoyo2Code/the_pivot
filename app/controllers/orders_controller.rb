class OrdersController < ApplicationController
  skip_before_action :require_user  
  def index
    @orders = current_user.orders
  end

  def create
    order = current_user.orders.create
    @cart.find_items.each do |item|
      order.order_items.create(item_id: item.id, title: item.title, quantity: @cart.contents[item.id.to_s], price: item.price)
    end
    @cart.contents.clear
    flash[:notice] = "Order Successfully Placed!"
    redirect_to orders_path
  end

  def show
    @order_number = @_request.env["PATH_INFO"].split("/").last
    current_user.orders.find(@order_number)
    @order = current_user.orders.find(@order_number)
  end


end
