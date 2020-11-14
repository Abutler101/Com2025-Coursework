require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_orders_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_orders_create_url
    assert_response :success
  end

  test "should get new" do
    get admin_orders_new_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_orders_destroy_url
    assert_response :success
  end

end
