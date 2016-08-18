class Api::V1::ItemsController < ApplicationController
  respond_to :json
  skip_before_action :require_user, :require_admin

  def index
    respond_with Item.all
  end
end
