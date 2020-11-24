require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'should have default total cost' do
    order = Order.new(email: "BillingEmail@bill.com", user: users(:one))
    assert_equal(0,order.totalCost)
  end
  test 'should not save without user' do
    order = Order.new(totalCost: 52, email: "BillingEmail@bill.com")
    assert !order.save
  end
  test 'should not save without email' do
    order = Order.new(totalCost: 52, user: users(:one))
    assert !order.save
  end
  test 'should save valid order' do
    order = Order.new(totalCost: 52, email: "BillingEmail@bill.com", user: users(:one))
    assert order.save!
  end
  test 'orders belong to users' do
    assert_equal(users(:one).firstName, orders(:one).user.firstName)
  end
  test 'orders contain order entries' do
    assert_equal(2, orders(:one).order_entries.size)
  end
end
