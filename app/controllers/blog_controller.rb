class BlogController < ApplicationController
  layout 'pages'

  def index
    @posts = Blog.ordered_public('blog_postdate DESC')

    respond_to do |format|
      format.html { }
      format.rss {
        render :layout => false
      }
    end
  end

  def show
    @post = Blog.find_slug_public(params[:id]).first

    if @post
      render 'pages/blogpost'
    else
      render 'pages/notfound', :status => 404
    end
  end

  def category
    @posts = Blog.find_by_category(params[:name])
    render 'blog/index'
  end
end
