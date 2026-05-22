class UserMailer < ActionMailer::Base
  default :from => "hank@hankthecowdog.com"
  
  def contact_email(contact, store = false)
    @contact = contact

    if store
      mail(:to => Settings.store_contact_email_to, :subject => "Message From Hankthecowdog.com")
    else
      mail(:to => Settings.contact_email_to, :subject => "Message From Hankthecowdog.com")
    end

  end
end
