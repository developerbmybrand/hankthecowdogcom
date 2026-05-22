class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :validate_user

  def validate_user
    redirect_to admin_path if current_auth.nil?
  end

  def current_auth
    if cookies.signed[:c]
      if User.authenticate(cookies.signed[:c], cookies.signed[:d])
        @current_auth = Hashie::Mash.new('email' => cookies.signed[:c], 'password' => cookies.signed[:d])
      else
        @current_auth = nil
      end
    end
  end

  def current_user
    if cookies.signed[:c]
      if User.authenticate(cookies.signed[:c], cookies.signed[:d])
        @current_user = User.find_by_user_password(cookies.signed[:c], cookies.signed[:d])
      else
        @current_user = nil
      end
    end
  end

end