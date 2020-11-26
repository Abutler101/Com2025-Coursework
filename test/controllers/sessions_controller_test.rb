require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get login page if not logged in' do
    get login_url
    assert_response(:success)
  end
  test 'should not get login page if logged in' do
    sign_in_as_tester
    get login_url
    assert_redirected_to(root_url)
    assert_equal 'Already have an existing account', flash[:warning]
  end
  test 'should login when correct params given' do
    post login_url, params: {email: users(:one).email, password: "t00l33t4u"}
    assert_redirected_to(root_url)
    assert_equal("Successful login - #{users(:one).firstName}", flash[:success])
  end
  test 'should not login when incorrect params given' do
    post login_url, params: {email: users(:one).email, password: "aaaaaaa"}
    assert_redirected_to(root_url)
    assert_equal 'Login Failed', flash[:danger]
  end
  test 'should logout if logged in' do
    sign_in_as_tester
    get logout_url
    assert_redirected_to(root_url)
    assert_equal 'Logged out successfully', flash[:warning]
  end
  test 'should not logout if not logged in' do
    get logout_url
    assert_redirected_to(root_url)
    assert_equal 'Not logged in', flash[:warning]
  end
end
