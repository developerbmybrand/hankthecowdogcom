class AuthorController < ApplicationController
  layout 'pages'
  
  def index
    @contact = Contact.new
    @events = Blog.events_public("blog_postdate").limit(3)
  end
  
  def create
    @contact = Contact.new(params[:contact])

    if @contact.valid?
      if verify_recaptcha(:model => @contact, :message => "Please check the reCaptcha checkbox.")
        UserMailer.contact_email(@contact).deliver
        flash[:notice] = "Message sent! Thank you for contacting us."
      end
    end
    @events = Blog.events_public("blog_postdate DESC").limit(3)
    render :action => "index"
  end
  
end
