class CategoriesController < ApplicationController
  def index
    @categories = { all: Category.all }
    @products = Product.all
    render :show
  end

  def show
    @categories = { all: Category.all, selected: Category.find(params[:id]) }
    @products = @categories[:selected].products
  end
end
