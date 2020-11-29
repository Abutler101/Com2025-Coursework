require 'test_helper'
class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'should get table of all products' do
    sign_in_as_admin
    get admin_products_url
    assert_response(:success)
    assert_select 'body.products' do
      assert_select 'a.btn.btn-sm.btn-danger', Product.count
    end
  end
  test 'should not get prod table if not admin' do
    sign_in_as_tester
    get admin_products_url
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
  test 'should get new product form' do
    sign_in_as_admin
    get new_admin_product_url
    assert_response(:success)
    assert_select 'form#NewProdForm' do
      assert_select 'input', 6
      assert_select 'textarea', 1
      assert_select 'select', 1
    end
  end
  test 'should not get new prod form if not admin' do
    sign_in_as_tester
    get new_admin_product_url
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
  test 'should create a new product' do
    sign_in_as_admin
    imgFile = fixture_file_upload('files/Tester.png')
    assert_difference('Product.count',1) do
    post admin_products_url, params: {product: {name: 'tsetdorp', description: 'test description', image: imgFile,
                                                  stockCount: 23, pricePence: 42, section_id: Section.first.id},
                                                  commit: 'Create Product'}
    end
    assert_response(:redirect)
    assert_redirected_to(admin_products_url)
    assert_equal "New product created", flash[:success]
  end
  test 'should not create a new product if not admin' do
    sign_in_as_tester
    post admin_products_url, params: {product: {name: 'tsetdorp', description: 'test description', image: "asd",
                                                stockCount: 23, pricePence: 42, section_id: Section.first.id},
                                      commit: 'Create Product'}
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
  test 'should delete a product' do
    sign_in_as_admin
    assert_difference 'Product.count', -1 do
      delete admin_product_url(products(:one))
    end
    assert_response(:redirect)
    assert_redirected_to(admin_products_url)
    assert_equal 'Product deleted', flash[:success]
  end
  test 'should not delete a product if not admin' do
    sign_in_as_tester
    assert_no_difference 'Product.count' do
      delete admin_product_url(products(:one))
    end
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
end
