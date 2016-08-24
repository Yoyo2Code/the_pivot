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
      #Apply ActiveRecord Validation Error
      render :new
    end
  end

  def show
    @business = Business.find_by(slug: params[:id])
  end
  #
  # def edit
  #   @business = Business.find(params[:id])
  # end
  #
  # def update
  #   business = Business.find(params[:id])
  #   if business.update(business_params)
  #     flash[:success] = "Business Successfully Updated!"
  #     redirect_to dashboard_path
  #   else
  #     flash[:failure] = "Something went wrong! Please try again."
  #     render :edit
  #   end
  # end

  private

  def business_params
    params.require(:business).permit(:name, :image_url)
  end
end
