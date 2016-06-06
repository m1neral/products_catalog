class CategoriesController < ApplicationController
  def index
    @categories = Category.all_with_selected
    @products = Product.all
    render :show
  end

  def show
    @categories = Category.all_with_selected(params[:id])
    @products = @categories[:selected].products
  end
end
