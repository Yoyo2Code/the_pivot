class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(title: params[:title].to_s.downcase)
  end

end
