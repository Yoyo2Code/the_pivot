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
    @order_status = "Complete"
    redirect_to orders_path
  end

  def show
    @order_number = @_request.env["PATH_INFO"].split("/").last
    @order = current_user.orders.find(@order_number)
    @order_total = order_total(@order)
    @order_status = "Complete"
  end

  def order_total(order)
    price = order.order_items[0].price
    quantity = order.order_items[0].quantity

    price * quantity
  end

  def destroy
    # require "pry"; binding.pry
    @order = current_user.orders[0].order_items
    @order_status = "Canceled"
    redirect_to order_path
  end


end
