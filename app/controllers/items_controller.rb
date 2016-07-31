class ItemsController < ApplicationController
  skip_before_action :require_user

  def index
    @items = Item.all
  end

  def show
    order_item = OrderItem.find(params[:id])
    @item = Item.find(order_item.item_id)
  end

end
