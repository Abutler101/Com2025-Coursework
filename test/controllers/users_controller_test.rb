require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get signup page if not logged in' do
    get signup_url
    assert_response(:success)
  end
  test 'Should not get signup if logged in' do
    sign_in_as_tester
    get signup_url
    assert_redirected_to(root_url)
    assert_equal 'Already have an existing account', flash[:warning]
  end
  test 'should close account if logged in' do
    sign_in_as_tester
    assert_difference('User.count', -1) do
      get shutdown_url
    end
    assert_redirected_to(root_url)
    assert_equal 'Account successfully closed', flash[:warning]
  end
  test 'should not close account if not logged in' do
    assert_no_difference('User.count') do
      get shutdown_url
    end
    assert_redirected_to(root_url)
    assert_equal 'Not logged in', flash[:warning]
  end
  test 'should create a user' do
    assert_difference('User.count', +1) do
      post signup_url, params: {user: {firstName: 'Alexis', lastName: 'Butler',
                                       email: 'lexieb101@gmail.com', password: '5ecurep@55w0rd',
                                       password_confirmation: '5ecurep@55w0rd'}}
    end
    assert_redirected_to(root_url)
    assert_equal 'Account created', flash[:success]
  end
  test 'should reject mallformed user creation' do
    assert_no_difference('User.count') do
      post signup_url, params: {user: {firstName: '', lastName: 'Butler',
                                       email: 'lexieb101@gmail.com', password: '5ecurep@55w0rd',
                                       password_confirmation: '5ecurep@55w0rd', admin: true}}
    end
    assert_redirected_to(root_url)
    assert_equal 'Sorry, something went wrong', flash[:danger]
  end
end
#Not sure if tests should be commented. The names should be enough?