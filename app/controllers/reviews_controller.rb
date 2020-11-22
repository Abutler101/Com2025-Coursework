# Product Reviews Controller - manage the adding and removal of reviews. Must be logged in to interact with
class ReviewsController < ApplicationController
  before_action :req_login
  # Create and store a review from given info in strong params.
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

  # Remove a target review if you are the same user who posted it
  def destroy
    @review = Review.find params[:id]
    if curr_user == @review.user
      @review.destroy
      flash[:success] = t(:review_deleted)
    end
    redirect_to product_url(@review.product_id)
  end

  private
  # When creating a review the only params it will take are rating and content
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
