class ItemsController < ApplicationController
  skip_before_action :require_user

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

end
