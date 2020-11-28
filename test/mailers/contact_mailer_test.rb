require 'test_helper'
class ContactMailerTest < ActionMailer::TestCase
  test 'should do a contact email' do
    mail = ContactMailer.contact_email("ab02259@surrey.ac.uk", "Alexis Butler", "07809179117",
                                       "Help I'm stuck writing rails tests")
    assert_equal ['outreach@ab02259_coursework.com'], mail.to
    assert_equal ['outreach@ab02259_coursework.com'], mail.from
  end
end
