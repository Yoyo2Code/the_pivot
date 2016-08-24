class Api::V1::PropertiesController < Api::V1::BaseController
  # skip_before_action :require_user, :require_admin

  def index
    respond_with find_property_scope
  end

  def show
    property = Property.find_by(id: params[:property_id])
    respond_with property.formatted_nights
  end

  private
  def find_property_scope
    business = Business.find_by(slug: params[:property_scope])
    if business
      business.properties.all
    else
      location = Location.find_by(slug: params[:property_scope])
      location.properties.all
    end
  end
end
