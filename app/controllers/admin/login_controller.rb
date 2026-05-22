class Admin::LoginController < ApplicationController
  layout 'admin'

  def index
    if current_auth.nil?
      @user = User.new
    else
      redirect_to admin_contents_path
    end
  end

  def authenticate
    @user = User.authenticate(params[:email], params[:password])
    if @user
      cookies.permanent.signed[:c] =  params[:email]
      cookies.permanent.signed[:d] =  params[:password]
      redirect_to admin_contents_path
    else
      flash.now[:errors] = 'Username or password is not correct.'
      render :action => :index
    end
  end

  def logout
    deauthorize_user
    redirect_to admin_path
  end

  private

  def current_auth
    if cookies.signed[:c]
      User.authenticate(cookies.signed[:c], cookies.signed[:d]) ? Hashie::Mash.new('email' => cookies.signed[:c], 'password' => cookies.signed[:d]) : nil
    end
  end

  def deauthorize_user
    cookies.delete :c
    cookies.delete :d
  end
end
