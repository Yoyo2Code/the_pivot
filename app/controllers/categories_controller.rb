class CategoriesController < ApplicationController
  skip_before_action :require_user
  skip_before_action :require_admin

  def show
    @category = Category.find_by(title: params[:category_title].to_s.downcase)
  end

end
