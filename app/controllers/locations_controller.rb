class LocationsController < ApplicationController

  def show
    @location = Location.find_by(title: params[:location_title].to_s.downcase)
  end
end
