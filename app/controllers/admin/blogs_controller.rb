class Admin::BlogsController < Admin::BaseController
  
  def index
    sort_params = { "by_title" => "blog_title",
                    "by_category" => "type_blog_categories.type_name",
                    "by_postdate" => "blog_postdate DESC",
                    "by_published" => "blog_published DESC" }
    @blogs = Blog.ordered(sort_params[params[:sort]])

    respond_to do |format|
      format.html 
    end
  end

  def show
    @blog = Blog.find(params[:id])
    
    respond_to do |format|
      format.html 
    end
  end

  def new
    @blog = Blog.new
    @blog_tags = TypeBlogTag.all
    @blog.blog_author = current_user.first_name

    respond_to do |format|
      format.html 
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    @blog_tags = TypeBlogTag.all
  end

  def create
    @blog = Blog.new(blog_parms)
    @blog.user_id = current_user.id
    @blog.blog_slug = params[:blog][:blog_title].to_url    
    @blog.blog_tags = params[:tags].join(',') unless params[:tags].nil?

    respond_to do |format|
      if @blog.save
        format.html { redirect_to([:admin, @blog], :notice => 'Blog was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.blog_slug = params[:blog][:blog_title].to_url
    @blog.blog_tags = params[:tags].join(',') unless params[:tags].nil?

    respond_to do |format|
      if @blog.update_attributes(blog_parms)
        format.html { redirect_to([:admin, @blog], :notice => 'Blog was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to('/admin/blogs')
  end

  private
  def blog_parms
    params.require(:blog).permit(:user_id, :type_blog_category_id, :blog_title, :blog_body, :blog_author, :blog_image, :blog_slug, :blog_tags, :blog_postdate, :blog_published, :blog_comments_allowed)    
  end
end
