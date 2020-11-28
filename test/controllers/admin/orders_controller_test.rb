require 'test_helper'
class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test 'should get table of orders if admin' do
    sign_in_as_admin
    get admin_orders_url
    assert_response(:success)
    assert_select 'body.orders' do
      assert_select 'a.btn.btn-sm.btn-danger', Order.count
    end
  end
  test 'should not get table of orders if not admin' do
    sign_in_as_tester
    get admin_orders_url
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
  test 'should delete an order' do
    sign_in_as_admin
    assert_difference('Order.count',-1) do
      delete admin_order_url(id: orders(:one))
    end
    assert_response(:redirect)
    assert_redirected_to(admin_orders_url)
    assert_equal 'Order deleted', flash[:success]
  end
  test 'should not delete an order if not an admin' do
    sign_in_as_tester
    assert_no_difference('Order.count') do
      delete admin_order_url(id: orders(:one))
    end
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
end
