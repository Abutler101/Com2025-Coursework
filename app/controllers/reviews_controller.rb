class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user = curr_user

    if @review.save
      flash[:success] = t(:review_success)
    else
      flash[:danger] = t(:review_failed)
    end
    redirect_to product_url(@product.id)
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    flash[:success] = t(:review_deleted)
    redirect_to product_url(@review.product_id)
  end

  private
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
