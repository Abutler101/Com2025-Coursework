require 'test_helper'
class Admin::SectionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get table of all sections' do
    sign_in_as_admin
    get admin_sections_url
    assert_response(:success)
    assert_select 'body.sections' do
      assert_select 'a.btn.btn-sm.btn-danger', Section.count
    end
  end
  test 'should not get sect table if not admin' do
    sign_in_as_tester
    get admin_sections_url
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
  test 'should get new section form' do
    sign_in_as_admin
    get new_admin_section_url
    assert_response(:success)
    assert_select 'form#NewSectForm' do
      assert_select 'input', 3
    end
  end
  test 'should not get new sect form if not admin' do
    sign_in_as_tester
    get new_admin_section_url
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
  test 'should create a new section' do
    sign_in_as_admin
    assert_difference('Section.count',1) do
      post admin_sections_url, params: {section: {name: 'SectionTest'}}
    end
    assert_response(:redirect)
    assert_redirected_to(admin_sections_url)
    assert_equal "New section created", flash[:success]
  end
  test 'should not create a new section if not admin' do
    sign_in_as_tester
    assert_no_difference('Section.count',) do
      post admin_sections_url, params: {section: {name: 'SectionTest'}}
    end
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
  test 'should delete a section' do
    sign_in_as_admin
    assert_difference 'Section.count', -1 do
      delete admin_section_url(sections(:one))
    end
    assert_response(:redirect)
    assert_redirected_to(admin_sections_url)
    assert_equal 'Section deleted', flash[:success]
  end
  test 'should not delete a product if not admin' do
    sign_in_as_tester
    assert_no_difference 'Section.count' do
      delete admin_section_url(sections(:one))
    end
    assert_response(:redirect)
    assert_redirected_to(root_url)
    assert_equal 'You must be admin to go there!', flash[:danger]
  end
end
