require 'test_helper'

class OrderEntryTest < ActiveSupport::TestCase
  test 'should have default quantity' do
    ordent = OrderEntry.new(unitprice: 52, totalprice: 208, product: products(:one), order: orders(:one))
    assert_equal(0, ordent.quantity)
  end
  test 'should have default unitprice' do
    ordent = OrderEntry.new(quantity: 4, totalprice: 208, product: products(:one), order: orders(:one))
    assert_equal(0, ordent.unitprice)
  end
  test 'should not save without product' do
    ordent = OrderEntry.new(quantity: 4, unitprice: 52, totalprice: 208, order: orders(:one))
    assert !ordent.save
  end
  test 'should save valid order entry' do
    ordent = OrderEntry.new(quantity: 4, unitprice: 52, totalprice: 208, product: products(:one), order: orders(:one))
    assert ordent.save!
  end
  test 'belongs to an order' do

  end
  test 'references a product' do

  end
end
