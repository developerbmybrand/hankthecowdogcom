class EventsController < ApplicationController
  layout 'pages'
  
  def index
    @post = Blog.events_public("blog_postdate")
    render 'pages/events'
  end
  
  def show
    @post = Blog.find_slug_public(params[:id])
    render '/pages/blogpost'
  end
  
end
