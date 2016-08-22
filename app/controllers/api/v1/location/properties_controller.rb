class Api::V1::Location::PropertiesController < ApplicationController
  respond_to :json
  # skip_before_action :require_user, :require_admin

  def index
    @properties = find_properties
    respond_with @properties
  end

  private

  def find_properties
    location = Location.find_by(slug: params[:city])
    location.properties.all
  end
end
