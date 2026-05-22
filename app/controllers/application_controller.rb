class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_partials, :load_edition
  helper_method :current_auth, :full_site, :is_blog_post, :site_url
  has_mobile_fu

  protected

  def render_not_found
    render "pages/notfound", :status => 404
  end

  def load_partials
    @featured_book = Book.featured.first
  end

  def load_edition
    if full_site || is_device?('ipad')
      request.format = :html
      session[:mobile_view] = false
      session[:tablet_view] = false
    else
      request.format = :mobile if is_mobile_device?
    end
  end

  def current_secforce_auth
    if cookies.signed[:a]
      if Secforce.authenticate(cookies.signed[:a], cookies.signed[:b])
        @current_secforce_auth = Hashie::Mash.new('username' => cookies.signed[:a], 'password' => cookies.signed[:b])
      end
    end
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

  # Should this session run in Full-Site mode?
  def full_site
    if cookies.signed[:fullsite]
      cookies.signed[:fullsite] == true ? true : false
    else
      false
    end
  end

  def site_url
    request.url
  end

  # Set Full-Site mode
  def set_full_site(value)
    if value == true
      cookies.permanent.signed[:fullsite] = true
    else
      cookies.permanent.signed[:fullsite] = false
    end
  end

  def is_blog_post
    request.fullpath.match(/^\/blog\//) ? true : false
  end
end
