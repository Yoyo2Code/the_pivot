class CategoriesController < ApplicationController
  skip_before_action :require_user

  def show
    @category = Category.find_by(title: params[:category_title].to_s.downcase)
  end

end
