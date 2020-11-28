require 'test_helper'
class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test 'should get dashboard if logged in and admin' do
    sign_in_as_admin
    get admin_root_url
    assert_response(:success)
    assert_select 'h4' do
      assert_select 'a', 4
    end
  end
  test 'should not get dashboard if logged in but not admin' do
    sign_in_as_tester
    get admin_root_url
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
  test 'should not get dashboard if not logged in' do
    get admin_root_url
    assert_response(:redirect)
    assert_redirected_to(login_url)
    assert_equal 'Login to view this content', flash[:danger]
  end

end
