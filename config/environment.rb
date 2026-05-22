# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Hankthecowdog::Application.initialize!

ActionMailer::Base.delivery_method = :smtp

# TODO: Will need the dotenv gem to test locally
ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SMTP_USERNAME'],
  :password => ENV['SMTP_PASSWORD'],
  :domain => "hankthecowdog.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain
}

ActionMailer::Base.default_url_options = { :host => 'localhost:3000' }