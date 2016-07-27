class CartItemsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to root_path
  end

  def destroy
    item  = Item.find(params[:item_id])
    @cart.delete_item(item.id)
    flash[:notice] = "Successfully removed #{view_context.link_to(item.title, cart_items_path({item_id: item.id}))}"
    redirect_to cart_index_path
  end
end
