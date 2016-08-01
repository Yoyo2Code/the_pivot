class ItemsController < ApplicationController
  skip_before_action :require_user

  def index
    @items = Item.all
  end

  def show
    if @_request.env["HTTP_REFERER"].split("/")[3] && @_request.env["HTTP_REFERER"].split("/") == "items" || @_request.env["HTTP_REFERER"].split("/").count == 3
      @item = Item.find(params[:id])
    else
      order_item = OrderItem.find(params[:id])
      @item = Item.find(order_item.item_id)
    end
  end

end
