class User < ActiveRecord::Base
  require 'digest'

  has_many :blogs

  # Validation
  validates_presence_of :email

  # Scopes
  scope :ordered, -> (parm) {
    order(parm || 'created_at DESC')
  }

  def self.authenticate(username, password)
    password = Digest::MD5.hexdigest(password)
    User.where(:email => username).where(:password => password).count > 0 ? true : false
  end

  def self.find_by_user_password(username, password)
    password = Digest::MD5.hexdigest(password)
    User.where("email = '#{username}' AND password = '#{password}'").first
  end

  #Formatters  
  def full_name
    first_name + " " + last_name
  end
end
