class LocationsController < ApplicationController
  # skip_before_action :require_user
  # skip_before_action :require_admin

  def show
    @location = Location.find_by(title: params[:location_title].to_s.downcase)
  end

end
