class CategoriesController < ApplicationController
  def index
    render :show
  end

  def show
    @category = Category.find(params[:id])
  end
end
