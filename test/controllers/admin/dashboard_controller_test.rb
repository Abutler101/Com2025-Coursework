require 'test_helper'
#TODO: Write Admin controller tests
class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dashboard_index_url
    assert_response :success
  end

end
