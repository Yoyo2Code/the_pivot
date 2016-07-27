class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(title: params[:category_title].to_s.downcase)
  end

end
