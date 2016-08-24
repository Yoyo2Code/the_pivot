class Admin::PropertiesController < Admin::BaseController
  def edit
    @property = current_user.business.properties.find(params[:id])
  end

  def update
    property = current_user.business.properties.find(params[:id])
    if property.update(property_params)
      flash[:success] = "Property successfully updated!"
      redirect_to property_path(property, business_name: property.business.slug)
    else
      render :edit
    end
  end

  private

  def property_params
    params.require(:property).permit(:title, :description, :price_per_guest, :max_occupancy, :image_path)
  end
end
