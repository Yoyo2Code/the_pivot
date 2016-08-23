class BusinessesController < ApplicationController
  def new
    @business = Business.new
  end

  def create
    business = Business.new(business_params)
    business.update(user_id: current_user.id)
    if business.save!
      flash[:success] = 'Your business application has been submitted!'\
                        'We will be getting back to you shortly.'
      redirect_to dashboard_path
    else
      #Apply ActiveRecord Validation Error
      render :new
    end
  end

  def show
    @business = Business.find_by(slug: params[:id])
  end

  private
    def business_params
      params.require(:business).permit(:name)
    end
end
