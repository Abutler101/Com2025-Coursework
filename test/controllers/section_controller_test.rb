require 'test_helper'

class SectionControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get section_show_url
    assert_response :success
  end

end
