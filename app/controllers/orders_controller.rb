class OrdersController < ApplicationController
  # skip_before_action :require_admin
  # skip_before_action :require_user, only: [:show, :destroy]

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
    # @order_number = @_request.env["PATH_INFO"].split("/").last
    @order = current_user.orders.find(params[:id])
    # @order_total = order_total(@order)
  end

  # def order_total(order)
  #   prices = order.order_items.pluck(:price)
  #   quantities = order.order_items.pluck(:quantity)
  #
  #   prices.map do |price|
  #     quantities[prices.index(price)] * price
  #   end.sum.to_f
  # end

  def destroy
    @order = current_user.orders.find(params[:id])
    @order.update(status: "cancelled")
    redirect_to order_path(@order)
  end
end
