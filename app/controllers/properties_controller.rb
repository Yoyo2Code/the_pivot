class PropertiesController < ApplicationController
  def index
    business = Business.find_by(slug: params[:business_name])
    if business
      @properties = business.properties.all
    else
      redirect_to root_path
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  # def new
  #   @item = Item.new
  # end

  # def create
  #   location = Location.find_or_create_by(title: params[:item][:location].downcase)
  #   item = location.items.create(item_params)
  #   if item.save
  #     redirect_to item_path(item)
  #   else
  #     render :new
  #   end
  # end
  #
  # def edit
  #   @property = Property.find(params[:id])
  # end
  #
  # def update
  #   property = current_user.business.properties.find(params[:id])
  #   if property.update(property_params)
  #     flash[:success] = "Property successfully updated!"
  #     redirect_to property_path(property, business_name: property.business.slug)
  #   else
  #     render :edit
  #   end
  # end
  #
  # private
  #
  # def property_params
  #   params.require(:property).permit(:title, :description, :price_per_guest, :max_occupancy, :image_path)
  # end
end
