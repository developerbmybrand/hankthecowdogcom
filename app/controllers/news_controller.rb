class NewsController < ApplicationController
  layout 'pages'

  def index
    @post = Blog.news_public
    render 'pages/news'
  end

  def show
    @post = Blog.find_slug_public(params[:id])
    render '/pages/blogpost'
  end

end
