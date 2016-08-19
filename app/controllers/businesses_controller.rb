class BusinessesController < ApplicationController
  def new
    @business = Business.new
  end

  def create
    business = Business.new(business_params)
    if business.save!
      RoleDelegator.new(business).assign_role('pending')
      flash[:success] = 'Your business application has been submitted!'\
                        'We will be getting back to you shortly.'
      redirect_to dashboard_path
    else
      #Apply ActiveRecord Validation Error
      render :new
    end
  end

  private
    def business_params
      params.require(:business).permit(:name)
    end
end
