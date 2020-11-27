require 'test_helper'
class OrdersControllerTest < ActionDispatch::IntegrationTest
  test 'Should show a specific order when logged in' do
    sign_in_as_tester
    get order_url(orders(:one))
    assert_response(:success)
    assert_select 'body.orders' do
      assert_select 'img', 2 #Order 1 has 2 order entries, each will have a row in the table with their image in a cell
    end
  end
  test 'should not show an order when not logged in' do
    get order_url(orders(:one))
    assert_response(:redirect)
    assert_redirected_to(login_url)
    assert_equal 'Login to view this content', flash[:danger]
  end
  test 'should create an order' do
    sign_in_as_tester
    assert_difference('Order.count', +1) do
      post orders_url, params: {order: {totalCost: 100, Email: "alternateBillEmail@testfix.com", user:users(:one)}}
    end
    assert_response(:redirect)
    assert_equal 'Order has been placed', flash[:notice]
  end
  test 'should not create an order when not logged in' do
    assert_no_difference('Order.count') do
      post orders_url, params: {order: {totalCost: 100, Email: "alternateBillEmail@testfix.com", user:users(:one)}}
    end
    assert_response(:redirect)
    assert_redirected_to(login_url)
    assert_equal 'Login to view this content', flash[:danger]
  end
end
