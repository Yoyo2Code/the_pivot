class CartController < ApplicationController
  # skip_before_action :require_user
  # skip_before_action :require_admin

  def index
    @properties = @cart.find_item
    render layout: "cart"
  end
end
