require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test 'should create a review on a product' do
    sign_in_as_tester
    assert_difference('Review.count', +1) do
      post product_reviews_url(products(:one)), params: {review: {rating: 3, content: 'A review content'}}
    end
    assert_redirected_to(product_url(products(:one)))
    assert_equal 'Review Posted', flash[:success]
  end
  test 'should reject a mallformed review on a product' do
    sign_in_as_tester
    assert_no_difference('Review.count') do
      post product_reviews_url(products(:one)), params: {review: {content: 'A review content'}}
    end
    assert_redirected_to(product_url(products(:one)))
    assert_equal 'Failed to post Try again', flash[:danger]
  end
  test 'reviews should be shown on products' do
    get product_url(products(:one))
    assert_select('strong', "#{reviews(:two).rating} / 5")
  end
  test 'should delete a review from product when logged in as owner of review' do
    sign_in_as_tester
    post product_reviews_url(Product.last), params: {review: {rating: 3, content: 'A review content'}}
    assert_difference('Review.count', -1) do
      delete product_review_url(product_id: Product.last, id:Product.last.reviews.first.id)
    end
    assert_redirected_to(product_url(Product.last))
    assert_equal 'Review deleted', flash[:success]
  end
  test 'should not delete a review when not the review owner' do
    sign_in_as_tester
    assert_no_difference('Review.count') do
      delete product_review_url(product_id: products(:one), id:reviews(:three))
    end
    assert_redirected_to(product_url(Product.last))
  end

end
