class ItemsController < ApplicationController
  skip_before_action :require_user
  before_action :current_admin?, only: [:new, :create, :edit, :update]

  def index
    @items = Item.all
  end

  def show
    if @_request.env["HTTP_REFERER"].split("/") && @_request.env["HTTP_REFERER"].split("/")[3] == "orders"
      order_item = OrderItem.find(params[:id])
      @item = Item.find(order_item.item_id)
    else
      @item = Item.find(params[:id])
    end
  end

  def new
    @item = Item.new
  end

  def create
    category = Category.find_or_create_by(title: params[:item][:category].downcase)
    item = category.items.create(item_params)
    if item.save
      redirect_to item_path(item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if item.save
      redirect_to item_path(item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image_path)
  end

end
