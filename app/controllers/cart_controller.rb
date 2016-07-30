class CartController < ApplicationController
  skip_before_action :require_user

  def index
    @items = @cart.find_items
    render layout: "cart"
  end
end
