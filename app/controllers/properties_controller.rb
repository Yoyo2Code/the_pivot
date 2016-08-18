class PropertiesController < ApplicationController
  skip_before_action :require_user
  skip_before_action :require_admin, except: [:new, :create, :edit, :update]
  def index
    business = Business.find_by(slug: params[:category])
    location = Location.find_by(slug: params[:category])

    if location
      @properties = location.properties.all
    elsif business
      @properties = business.properties.all
    else
      # render :error
      #render 404
    end
  end

  def show
    @property = Property.find(params[:id])
    # if @_request.env["HTTP_REFERER"].split("/") && @_request.env["HTTP_REFERER"].split("/")[3] == "orders"
    #   order_item = OrderItem.find(params[:id])
    #   @item = Item.find(order_item.item_id)
    # else
    #   @item = Item.find(params[:id])
    # end
  end

  def new
    @item = Item.new
  end

  def create
    location = Location.find_or_create_by(title: params[:item][:location].downcase)
    item = location.items.create(item_params)
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
