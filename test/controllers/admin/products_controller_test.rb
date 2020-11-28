require 'test_helper'
#TODO: finish product admin tests
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

  end
  test 'should not get new prod form if not admin' do

  end
  test 'should create a new product' do

  end
  test 'should not create a new product if not admin' do

  end
  test 'should delete a product' do

  end
  test 'should not delete a product if not admin' do

  end
end
