require 'test_helper'
class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get table of all users' do
    sign_in_as_admin
    get admin_users_url
    assert_response(:success)
    assert_select 'body.users' do
      assert_select 'a.btn.btn-sm.btn-danger', User.count
    end
  end
  test 'should not get user table if not admin' do
    sign_in_as_tester
    get admin_users_url
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
  test 'should get new user form' do
    sign_in_as_admin
    get new_admin_user_url
    assert_response(:success)
    assert_select 'form#NewUsrForm' do
      assert_select 'input', 9
    end
  end
  test 'should not get new user form if not admin' do
    sign_in_as_tester
    get new_admin_user_url
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
  test 'should create a new user' do
    sign_in_as_admin
    assert_difference('User.count',1) do
      post admin_users_url, params: {user: {firstName: 'Random', lastName: 'Person', email: 'ran@gm.com',
                                            password: 'SuperSecure', password_confirmation: 'SuperSecure',
                                            admin: false}}
    end
    assert_response(:redirect)
    assert_redirected_to(admin_users_url)
    assert_equal "New user created", flash[:success]
  end
  test 'should not create a new user if not admin' do
    sign_in_as_tester
    assert_no_difference('User.count',1) do
      post admin_users_url, params: {user: {firstName: 'Random', lastName: 'Person', email: 'ran@gm.com',
                                            password: 'SuperSecure', password_confirmation: 'SuperSecure',
                                            admin: false}}
    end
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
  test 'should delete a user' do
    sign_in_as_admin
    assert_difference 'User.count', -1 do
      delete admin_user_url(users(:one))
    end
    assert_response(:redirect)
    assert_redirected_to(admin_users_url)
    assert_equal 'User deleted', flash[:success]
  end
  test 'should not delete a user if not admin' do
    sign_in_as_tester
    assert_no_difference 'User.count' do
      delete admin_user_url(users(:one))
    end
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
end
