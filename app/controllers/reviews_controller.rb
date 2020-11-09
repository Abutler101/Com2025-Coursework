class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user = User.first

    if @review.save
      flash[:success] = "Review Posted"
    else
      flash[:danger] = "Failed to post Try again"
    end
    redirect_to product_url(@product.id)
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    flash[:success] = "Review Deleted"
    redirect_to product_url(@review.product_id)
  end

  private
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
