Recaptcha.configure do |config|
  config.site_key  = Settings.recaptcha_public_key
  config.secret_key = Settings.recaptcha_private_key
  #config.proxy = 'http://localhost:3000'
end