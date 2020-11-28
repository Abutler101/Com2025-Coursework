# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_email
    ContactMailer.contact_email("Alexis@me.com", "Alexis Butler", "07809179117", @message = "Hello")
  end
end
