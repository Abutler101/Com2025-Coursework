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
      flash[:alert] = "Supply an email address for response"
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now
      flash[:notice] = "We'll be in touch"
    end
    redirect_to root_path
  end
end
