class CartItemsController < ApplicationController
  # skip_before_action :require_user
  # skip_before_action :require_admin

  def create
    property = Property.find(params[:property_id])
    cart_item = CartItem.new(
      property_id: params[:property_id],
      occupancy: params[:occupancy],
      starting_date: params[:starting_date],
      end_date: params[:end_date]
      )
    # session[:quantity] = cart_item.quantity
    @cart.add_item(property.id)
    session[:cart] = @cart.contents
    referer_path = request.env['HTTP_REFERER']
    if referer_path.include?("/cart")
      redirect_to cart_index_path
    else
      redirect_to property_path(property, business_name: property.business.slug)
    end
  end

  def destroy
    property  = Property.find(params[:item_id])
    @cart.delete_item(property.id)
    flash[:notice] = "Successfully removed #{view_context.link_to(property.title,
    cart_items_path({item_id: property.id}))}"
    redirect_to cart_index_path
  end
end
