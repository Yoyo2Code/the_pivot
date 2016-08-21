class RootController < ApplicationController

  def index
    @locations = Location.all
    @businesses = Business.all
  end
end
