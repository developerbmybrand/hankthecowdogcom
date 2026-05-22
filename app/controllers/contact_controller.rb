class ContactController < ApplicationController
  layout 'pages'
  
  def index
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])

    if @contact.valid?
      if verify_recaptcha(:model => @contact, :message => "Please check the reCaptcha checkbox.")
        UserMailer.contact_email(@contact, true).deliver
        flash[:notice] = "Message sent! Thank you for contacting us."
      end
    end
    render :action => "index"
  end
  
end
