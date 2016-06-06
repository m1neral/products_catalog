class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @categories = Category.all_with_selected(@product.category_id)
  end
end
