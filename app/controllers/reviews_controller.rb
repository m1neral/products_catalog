class ReviewsController < ApplicationController
  before_action :get_product, only: [:create]

  def create
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to(@product)
    else
      render 'products/show'
    end
  end

  private

  def get_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:msg)
  end
end
