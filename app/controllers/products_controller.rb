class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @categories = Category.get_categories_with_selected(@product.category_id)
  end
end
