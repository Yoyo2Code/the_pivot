class OrdersController < ApplicationController
  attr_accessor :quantity


  def index
    @orders = current_user.orders
  end

  def create
    order = current_user.orders.create
    @cart.find_items.each do |item|
      order.order_items.create(item_id: item.id, title: item.title, quantity: @cart.contents[item.id.to_s], price: item.price)
    end
    # order.order_items << @cart.find_items
    @cart.contents.clear
    flash[:notice] = "Order Successfully Placed!"
    redirect_to orders_path
  end

  def show
    @order_number = @_request.env["REQUEST_PATH"].split("/").last
    current_user.orders.find(@order_number)

    @order = current_user.orders.find(@order_number)


  end

  # def get_quantity(item_number)
  #   item = @order.order_items.find(item_number)
  #       @order_items = @cart.contents
  # end


end
