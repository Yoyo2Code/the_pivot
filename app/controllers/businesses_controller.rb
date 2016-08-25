class BusinessesController < ApplicationController
  def new
    @business = Business.new
  end

  def create
    business = Business.new(business_params)
    if business.update(user_id: current_user.id)
      flash[:success] = 'Your business application has been submitted!'\
      'We will be getting back to you shortly.'
      redirect_to dashboard_path
    else
      flash[:error] = 'You are not eligible to apply for a business or your application was invalid.\
      Please contact your system administrator.'
      render :new
    end
  end

  def show
    @business = Business.find_by(slug: params[:id])
  end

  private

  def business_params
    params.require(:business).permit(:name, :image_url)
  end
end
