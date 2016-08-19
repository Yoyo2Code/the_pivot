class PropertiesController < ApplicationController
  # skip_before_action :require_user
  # skip_before_action :require_admin, except: [:new, :create, :edit, :update]
  def index
    business = Business.find_by(slug: params[:business_name])
    if business
      @properties = business.properties.all
    else
      redirect_to root_path
    end
  end

  def show
    require 'pry'; binding.pry
    @property = Property.find(params[:id])
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
