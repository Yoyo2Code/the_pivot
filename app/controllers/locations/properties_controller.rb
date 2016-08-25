class Locations::PropertiesController < ApplicationController

  def index
    location = Location.find_by(slug: params[:city])
    if location
      @properties = location.properties.all
    else
      redirect_to root_path
    end
  end

end
