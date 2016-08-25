class Api::V1::BaseController < ApplicationController
  respond_to :json
  skip_before_action :authorize!
end
