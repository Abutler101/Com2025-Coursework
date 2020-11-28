require 'test_helper'
class CartsControllerTest < ActionDispatch::IntegrationTest
  test 'should add item to cart if logged in' do
    sign_in_as_tester
    put add_item_carts_url(product_id: Product.first.id)
    assert_response(:redirect)
    assert_equal 'Item added to cart', flash[:success]
  end
  test 'should not item to cart if not logged in' do
    put add_item_carts_url(product_id: Product.first.id)
    assert_response(:redirect)
    assert_redirected_to(login_url)
    assert_equal 'Login to view this content', flash[:danger]
  end
  test 'should remove item from cart if logged in' do
    sign_in_as_tester
    put add_item_carts_url(product_id: Product.first.id)
    delete remove_item_carts_url(product_id: Product.first.id)
    assert_response(:redirect)
    assert_equal 'Item removed from cart', flash[:success]
  end
  test 'should not remove item from cart if not logged in' do
    delete remove_item_carts_url(product_id: Product.first.id)
    assert_response(:redirect)
    assert_redirected_to(login_url)
    assert_equal 'Login to view this content', flash[:danger]
  end
  test 'should show the cart if logged in and items present' do
    sign_in_as_tester
    put add_item_carts_url(product_id: Product.first.id)
    put add_item_carts_url(product_id: Product.second.id)
    get carts_url
    assert_response(:success)
    assert_select 'body.carts' do
      assert_select 'img', 2 #Product Image for each product
    end

  end
  test 'should not show the cart if not logged in' do
    sign_in_as_tester
    put add_item_carts_url(product_id: Product.first.id)
    put add_item_carts_url(product_id: Product.second.id)
    signout
    get carts_url
    assert_response(:redirect)
    assert_redirected_to(login_url)
    assert_equal 'Login to view this content', flash[:danger]
  end
  test 'should indicate the cart is empty if logged in' do
    sign_in_as_tester
    get carts_url
    assert_response(:success)
    assert_select 'body.carts' do
      assert_select 'h1.alert', 'your cart is empty' ,1 #say that it's empty
    end
  end
  test 'should not indicate the cart is empty if not logged in' do
    get carts_url
    assert_response(:redirect)
    assert_redirected_to(login_url)
    assert_equal 'Login to view this content', flash[:danger]
  end
end
