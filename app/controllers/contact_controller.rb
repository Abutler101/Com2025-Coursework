class ContactController < ApplicationController
  def new
  end

  def create
    #Form Submitted time to do mailer jazz
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]
    if email.blank?
      flash[:alert] = t(:email_request_flash)
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now
      flash[:notice] = t(:in_touch)
    end
    redirect_to root_path
  end
end
