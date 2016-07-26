class CartController < ApplicationController

  def index
    id = @cart.contents.keys.first
    @item = Item.find(id)
  end
end
