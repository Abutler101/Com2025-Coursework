require 'test_helper'
class ContactControllerTest < ActionDispatch::IntegrationTest
  test 'should get contactus form' do
    get getintouch_url
    assert_response(:success)
    assert_select 'form#ContactForm' do
      assert_select 'input', 6 # text fields and the sub button
    end
  end
  test 'should accept a properly completed request' do
    post submit_contact_url, params: {name: 'Alexis', email: 'lexieb101@gmail.com', telephone: '07809179117', message: '5ecurep@55w0rd'}
    assert_redirected_to(root_url)
    assert_equal "We'll be in touch", flash[:notice]
  end
  test 'should reject a malformed request' do
    post submit_contact_url, params: {name: 'Alexis', email: '', telephone: '07809179117', message: '5ecurep@55w0rd'}
    assert_redirected_to(root_url)
    assert_equal 'Supply an email address for response', flash[:alert]
  end
end
