class CartItemsController < ApplicationController
  # skip_before_action :require_user
  # skip_before_action :require_admin

  def create
    @cart.add_item(params)
    session[:cart] = @cart.contents
    flash[:success] = "Successfully added booking to cart!"
    redirect_to cart_path
  end

  def destroy
    # property  = Property.find(params[:id])
    @cart.delete_item(params[:id])
    flash[:success] = "Successfully removed"
    # flash[:notice] = "Successfully removed #{view_context.link_to(property.title,
    # cart_items_path({item_id: property.id}))}"
    redirect_to cart_path
  end
end
