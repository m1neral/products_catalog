class CategoriesController < ApplicationController
  def index
    @categories = Category.get_categories_with_selected
    @products = Product.all
    render :show
  end

  def show
    @categories = Category.get_categories_with_selected(params[:id])
    @products = @categories[:selected].products
  end
end
