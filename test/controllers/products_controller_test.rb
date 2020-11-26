require 'test_helper'
class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'should show all products' do
    get root_url
    assert_response(:success)
    assert_select 'div.productTable' do
      assert_select 'article.product', 2
    end
  end
  test 'should show specific product' do
    get product_url(products(:one))
    assert_response(:success)
  end
  test 'should show product reviews' do
    get product_url(products(:one))
    assert_response(:success)
    assert_select 'article.productDetails' do
      assert_select 'strong', 3 # The only thing on the product detail view page that is strong is the review rating
    end
  end
  test 'should show review creation form if logged in' do
    sign_in_as_tester
    get product_url(products(:one))
    assert_response(:success)
    assert_select 'article.productDetails' do
      assert_select 'input'
    end
  end
  test 'should not have review form if not logged in' do
    get product_url(products(:one))
    assert_response(:success)
    assert_select 'article.productDetails' do
      assert_select 'input', 0
    end
  end
end
