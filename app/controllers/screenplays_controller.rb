class ScreenplaysController < ApplicationController
  layout 'pages'
    
  def index
    @screenplays = Screenplay.ordered_public("created_at DESC")
  end
  
  def detail
    begin

      @screenplay = Screenplay.find_id_public(params[:id]).first
      @contact = Contact.new

      if @screenplay
        render 'screenplays/detail'
      else
        render 'pages/notfound', :status => 404
      end

    rescue StandardError => e
      render 'pages/notfound', :status => 404
    end
  end
  
  def create
    @contact = Contact.new(params[:contact])

    if @contact.valid?
      if verify_recaptcha(:model => @contact, :message => "Please check the reCaptcha checkbox.")
        UserMailer.contact_email(@contact).deliver
        flash[:notice] = "Message sent! Thank you for contacting us."
      end
    end

    @screenplay = Screenplay.find_id_public(params[:id]).first
    render :action => "detail", :id => params[:id]
  end
end