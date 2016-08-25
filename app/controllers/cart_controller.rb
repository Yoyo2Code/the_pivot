class CartController < ApplicationController

  def index
    @cart_items = @cart.find_items
  end
end
