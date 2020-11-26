require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  test 'should show a specific section' do
    get section_url(sections(:one))
    assert_response(:success)
    assert_select('h1', sections(:one).name)
  end

end
