class ReviewsController < ApplicationController
  before_action :set_product, only: [:create, :destroy]
  before_action :set_review, only: [:destroy]

  def create
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to(@product, flash: {added: t('.added')})
    else
      render 'products/show'
    end
  end

  def destroy
    @review.destroy
    redirect_to(@product, flash: {removed: t('.removed')})
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:msg)
  end
end
