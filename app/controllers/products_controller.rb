class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @review = @product.reviews.new
  end
end
