class RootController < ApplicationController

  def index
    @locations = Location.all
    @businesses = Business.all
  end

  def show
    @properties = Property.all
  end
end
