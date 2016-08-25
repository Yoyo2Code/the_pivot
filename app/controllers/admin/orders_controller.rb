class Admin::OrdersController < ApplicationController
  def index
    @orders = current_user.business.reservations
  end
end
