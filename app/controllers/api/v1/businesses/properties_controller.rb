class Api::V1::Businesses::PropertiesController < Api::V1::BaseController
  def index
    business = Business.find_by(slug: params[:slug])
    ps = PropertySorter.new(business.properties)
    respond_with ps.booked_properties(params[:startDate],
                                      params[:endDate])
  end
end
