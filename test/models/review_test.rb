require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test 'should not save without product id' do
    rev = Review.new(content: "Content", rating: 3, user: users(:one))
    assert !rev.save
  end
  test 'should not save without user id' do
    rev = Review.new(content: "Content", rating: 3, product: products(:one))
    assert !rev.save
  end
  test 'should not save without content' do
    rev = Review.new(content: "", rating: 3, product: products(:one), user: users(:one))
    assert !rev.save
  end
  test 'should not save without rating' do
    rev = Review.new(content: "Content", product: products(:one), user: users(:one))
    assert !rev.save
  end
  test 'should save a valid review' do
    rev = Review.new(content: "This is good", rating: 3, product: products(:one), user: users(:one))
    assert rev.save
  end
  test 'belongs to a user' do
    assert_equal(users(:one).firstName, reviews(:one).user.firstName)
  end
  test 'belongs to a product' do
    assert_equal(products(:one).name, reviews(:one).product.name)
  end
end
