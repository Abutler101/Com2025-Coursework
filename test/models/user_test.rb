require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  end

  test 'should not save user without First name' do
    user = User.new({
                        email: "derp@gmail.com",
                        lastName: "Derpason",
                        password: "IamL33T"
                    })
    assert !user.save
  end
  test 'should not save user without Last name' do
    user = User.new({
                        email: "derp@gmail.com",
                        firstName: "Derp",
                        password: "IamL33T"
                    })
    assert !user.save
  end
  test 'should not save user without email' do
    user = User.new({
                        firstName: "Derp",
                        lastName: "Derpason",
                        password: "IamL33T"
                    })
    assert !user.save
  end
  test 'should not save user without password' do
    user = User.new({
                        firstName: "Derp",
                        lastName: "Derpason",
                        email: "derp@gmail.com"
                    })
    assert !user.save
  end
  test 'should save valid user' do
    user1 = User.new(email: "derp@gmail.com", firstName: "Derp", lastName: "Derpason", password: "IamL33T")
    assert user1.save!
  end
  test 'should not save user with duplicate email' do
    user1 = User.new(email: "derp@gmail.com", firstName: "Derp", lastName: "Derpason", password: "IamL33T")
    user2 = User.new(email: "derp@gmail.com", firstName: "Dupli", lastName: "caterson", password: "IamL33T")
    user1.save
    assert !user2.save
  end
  test 'user should have reviews' do
    assert_equal 2, users(:one).reviews.size
  end
  test 'user should have orders' do
    assert_equal 2, users(:one).orders.size
  end
end
