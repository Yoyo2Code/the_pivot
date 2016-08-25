class Admin::BusinessesController < ApplicationController

  def edit
    @business = current_user.business
  end

  def update
    business = current_user.business
    if business.update(business_params)
      flash[:success] = "Business Successfully Updated!"
      redirect_to dashboard_path
    else
      flash[:failure] = "Something went wrong! Please try again."
      render :edit
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :image_url)
  end
end
