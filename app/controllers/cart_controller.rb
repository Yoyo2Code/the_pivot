class CartController < ApplicationController
  skip_before_action :require_user
  skip_before_action :require_admin

  def index
    @items = @cart.find_items
    render layout: "cart"
  end
end
