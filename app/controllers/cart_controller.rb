class CartController < ApplicationController
  # skip_before_action :require_user
  # skip_before_action :require_admin

  def index
    @cart_items = @cart.find_items
    # @locations = Location.all
    # render layout: "cart", locations: @locations
  end
end
