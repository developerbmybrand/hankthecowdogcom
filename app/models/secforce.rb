class Secforce < ActiveRecord::Base

  def self.authenticate(username, password)
    password = Digest::MD5.hexdigest(password)
    Secforce.where(:secforce_username => username).where(:secforce_password => password).count > 0 ? true : false
  end

end