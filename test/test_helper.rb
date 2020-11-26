ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  Rails.application.load_seed

  def sign_in_as_tester
    post login_url, params: {email: users(:one).email, password: "t00l33t4u"}
  end
  def sign_in_as_admin
    post login_url, params: {email: users(:admin).email, password: "superSecret"}
  end
end
