class PagesController < ApplicationController
  
  def index
    @posts = Blog.ordered_public('blog_postdate DESC').limit(4)
    @banners = Banner.published
    @banner = @banners.first
    render 'pages/index', :layout => "application"
  end

  def books
    @books = Book.ordered_public(:book_volume_number)
    render 'pages/books'
  end
  
  def bookdetail
    @book = Book.find_id_public(params[:id]).first

    if @book
      render 'pages/bookdetail'
    else
      render_not_found
    end
  end

  def bookaudio
    @books = Book.ordered_public(:book_volume_number)
    render 'pages/bookaudio'    
  end

  def bookexcerpts
    render 'pages/bookexcerpts'    
  end
  
  def hankandpals
    render 'pages/hankandpals'    
  end
  def newsarchive
  	render 'pages/newsarchive'
  end
   def retailers
  	render 'pages/retailers'
  end
  def books_other
    render 'pages/books_other'
  end
  def books_youngadult
    render 'pages/books_youngadult'
  end

  def fanzone
    @friends = Friend.published_public
    @printouts = Printout.all
    render 'pages/fanzone'    
  end

  def friends
    @friends = Friend.published_public
    render 'pages/friends'
  end
  
  def frienddetail
    @friend = Friend.find_slug_public(params[:id]).first
    
    respond_to do |format|
      format.html {
        render 'pages/frienddetail'
      }
      format.json {
        render :json => @friend
      }

    end
  end  
  
  def games
    render 'pages/games'
  end

  def recipes
    @recipes = Recipe.ordered_public
    render 'pages/recipes'
  end

  def recipesdetail
    @recipe = Recipe.find_id_public(params[:id]).first
    if @recipe
      render 'pages/recipesdetail'
    else
      render_not_found
    end
  end
  
  def educational
    @screenplay = Screenplay.ordered_public('created_at DESC')
    @printouts = EduPrintout.ordered
    posts = Blog.find_by_category('Teachers Corner')
    @post = posts.first if posts
    render 'pages/educational'
  end
  
  def printouts
    @printouts = Printout.all
    render 'pages/printouts'
  end  

  def feature
    @content = Content.find_by_content_title_slug(params[:slug_name])
    render 'pages/notfound', :status => 404 if !@content || !@content.content_published
  end

  def music
    @songs = Song.ordered
    @ringtones = Ringtone.ordered
  end

  # /search/:term
  def search   
    @content_results = Content.search_public(params[:id])
    @blog_results = Blog.search_public(params[:id])
    @book_results = Book.search_public(params[:id])
    @recipe_results = Recipe.search_public(params[:id])
    @friend_results = Friend.search_public(params[:id])
    @screenplay_results = Screenplay.search_public(params[:id])
    render 'pages/search'    
  end
  
  def catcher
    render 'pages/notfound', :status => 404
  end
  
  def viewfullsite
    set_full_site(true)
    redirect_to('/')
  end

end
