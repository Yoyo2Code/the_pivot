class Api::V1::Locations::PropertiesController < Api::V1::BaseController
  def index
    location = Location.find_by(slug: params[:slug])
    ps = PropertySorter.new(location.properties)
    respond_with ps.booked_properties(params[:startDate],
                                      params[:endDate])
  end
end
