class CartItemsController < ApplicationController

  def create
    @cart.add_item(params[:booking])
    session[:cart] = @cart.contents
    flash[:success] = "Successfully added booking to cart!"
    redirect_to cart_path
  end

  def destroy
    @cart.delete_item(params[:id])
    flash[:success] = "Successfully removed"
    redirect_to cart_path
  end
end
