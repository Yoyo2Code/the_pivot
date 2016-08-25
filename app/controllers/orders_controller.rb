class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def create
    order = CartManager.new(user: current_user, cart: @cart).process_order
    @cart.contents.clear
    flash[:success] = "Your order has been placed!"
    redirect_to order_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def destroy
    @order = current_user.orders.find(params[:id])
    @order.update(status: "cancelled")
    redirect_to order_path(@order)
  end
end
