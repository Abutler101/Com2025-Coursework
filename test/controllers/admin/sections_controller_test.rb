require 'test_helper'

class Admin::SectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sections_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_sections_create_url
    assert_response :success
  end

  test "should get new" do
    get admin_sections_new_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_sections_destroy_url
    assert_response :success
  end

end
