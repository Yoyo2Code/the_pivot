class CartController < ApplicationController

  def index
    @items = @cart.find_items
  end

  
end
