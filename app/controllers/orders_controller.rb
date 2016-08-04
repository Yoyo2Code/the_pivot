class OrdersController < ApplicationController
  skip_before_action :require_admin
  skip_before_action :require_user, only: [:show, :destroy]

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
    @order = current_user.orders.find(@order_number)
    @order_total = order_total(@order)
  end

  def order_total(order)
    prices = order.order_items.pluck(:price)
    quantities = order.order_items.pluck(:quantity)

    prices.map do |price|
      quantities[prices.index(price)] * price
    end.sum.to_f
  end

  def destroy
    @order = current_user.orders.find(params[:id])
    @order.update(status: "cancelled")
    redirect_to order_path
  end


end
