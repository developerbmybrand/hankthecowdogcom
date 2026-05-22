class SecurityforceController < ApplicationController
  layout 'pages'

  def index
    redirect_to '/securityforce/member' unless current_secforce_auth.nil?
    #render 'securityforce/index'
  end

  def login
    if Secforce.authenticate(params[:username], params[:password])
      cookies.permanent.signed[:a] =  params[:username]
      cookies.permanent.signed[:b] =  params[:password]
      redirect_to '/securityforce/member'
    else
      flash.now[:errors] = 'Username or password is not correct.'
      render :action => :index
    end
  end

  def member
    unless current_secforce_auth.nil?
      @posts = Blog.ordered_securityforce('blog_postdate DESC')
      @newletter = Newsletter.published.first
      render 'securityforce/member'
    else
     redirect_to '/securityforce'
    end
  end

  def map
    unless current_secforce_auth.nil?
      render 'securityforce/map'
	  else
	    redirect_to '/securityforce'
	  end
  end
    def dancingcowboy
    unless current_secforce_auth.nil?
      render 'securityforce/dancingcowboy'
	  else
	    redirect_to '/securityforce'
	  end
  end
end
