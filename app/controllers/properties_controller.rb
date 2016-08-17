class PropertiesController < ApplicationController
  skip_before_action :require_user
skip_before_action :require_admin, except: [:new, :create, :edit, :update]
  def index
    @properties = Property.all
  end

  def show
    if @_request.env["HTTP_REFERER"].split("/") && @_request.env["HTTP_REFERER"].split("/")[3] == "orders"
      order_item = OrderItem.find(params[:id])
      @property = Property.find(order_item.item_id)
    else
      @property = Property.find(params[:id])
    end
  end

  def new
    @property = Property.new
  end

  def create
    location = Location.find_or_create_by(title: params[:property][:location].downcase)
    property = location.properties.create(item_params)
    if property.save
      redirect_to property_path(property)
    else
      render :new
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    property = Property.find(params[:id])
    property.update(property_params)
    if property.save
      redirect_to property_path(property)
    else
      render :edit
    end
  end

  private

  def property_params
    params.require(:property).permit(:title, :description, :price, :image_path)
  end

end
