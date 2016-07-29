class CartItemsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    cart_item = CartItem.new(item.id, 1)
    session[:quantity] = cart_item.quantity
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    referer_path = request.env['HTTP_REFERER']
    if referer_path.include?("/cart")
      redirect_to cart_index_path
    else
      redirect_to root_path
    end
  end

  def destroy
    item  = Item.find(params[:item_id])
    @cart.delete_item(item.id)
    flash[:notice] = "Successfully removed #{view_context.link_to(item.title,
    cart_items_path({item_id: item.id}))}"
    redirect_to cart_index_path
  end
end
