class Api::V1::PropertiesController < Api::V1::BaseController
  # skip_before_action :require_user, :require_admin

  def index
    @properties = find_properties
    respond_with @properties
  end

  def show
    property = Property.find_by(id: params[:property_id])
    respond_with property.bookings
  end

  private

  def find_properties
    business = Business.find_by(slug: params[:business_name])
    business.properties.all
  end
end
