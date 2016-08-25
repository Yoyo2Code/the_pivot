class Admin::OrdersController < ApplicationController
  def index
    @reservations = current_user.business.reservations
  end
end
