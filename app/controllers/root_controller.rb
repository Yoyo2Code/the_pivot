class RootController < ApplicationController

  def index
    @location = Location.first
  end
end
