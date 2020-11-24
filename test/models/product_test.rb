require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'should not save product without name' do
    prod = Product.new(name: '', description: 'Desc', stockCount: 2, pricePence: 52, image: 'TooLazyForRealImg', section: sections(:one))
    assert !prod.valid?
  end
  test 'should not save product without description' do
    prod = Product.new(name: 'testname', description: '', stockCount: 4, pricePence: 52, image: 'Image', section: sections(:one))
    assert !prod.valid?
  end
  test 'should have default stock count' do
    prod = Product.new(name: 'name', description: 'Desc', pricePence: 52, image: 'TooLazyForRealImg', section: sections(:one))
    assert_equal(0,prod.stockCount)
  end
  test 'should have default price' do
    prod = Product.new({name: 'name', description: 'Desc', stockCount: 2,
                        image: 'TooLazyForRealImg', section: sections(:one)})
    assert_equal(0, prod.pricePence)
  end
  test 'should not save product without section' do
    prod = Product.new({name: 'name', description: 'Desc', stockCount: 2,
                        pricePence: 52, image: 'TooLazyForRealImg'})
    assert !prod.valid?
  end
  test 'should save a valid product' do
    prod = Product.new({
                           name: "prodname",
                           description: "proddesc",
                           stockCount: 67,
                           pricePence: 7082,
                           image: "ImageFIle",
                           section_id: sections(:one).id
                       })
    assert prod.valid?
  end
  test 'product has reviews' do
    assert_equal(reviews(:one).content, products(:one).reviews.first.content)
  end
  test 'product belongs to a section' do
    assert_equal(sections(:one).name, products(:one).section.name)
  end
end
