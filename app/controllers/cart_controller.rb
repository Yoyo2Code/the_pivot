class CartController < ApplicationController

  def index
    @items = @cart.find_items
    render layout: "cart"
  end
end
