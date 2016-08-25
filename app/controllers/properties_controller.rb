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
end
