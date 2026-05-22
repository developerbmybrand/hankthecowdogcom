class Admin::TypeBlogTagsController < Admin::BaseController

  def index
    @admin_type_blog_tags = TypeBlogTag.ordered(:type_name)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @admin_type_blog_tag = TypeBlogTag.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @admin_type_blog_tag = TypeBlogTag.find(params[:id])
  end

  def create
    @admin_type_blog_tag = TypeBlogTag.new(admin_params)

    respond_to do |format|
      if @admin_type_blog_tag.save
        format.html { redirect_to('/admin/type_blog_tags', :notice => 'Type blog category was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @admin_type_blog_tag = TypeBlogTag.find(params[:id])

    respond_to do |format|
      if @admin_type_blog_tag.update_attributes(admin_params)
        format.html { redirect_to('/admin/type_blog_tags', :notice => 'Type blog category was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @admin_type_blog_tag = TypeBlogTag.find(params[:id])
    @admin_type_blog_tag.destroy

    redirect_to('/admin/type_blog_tags')
  end

  private
  def admin_params
    params.require(:type_blog_tag).permit(
      :type_name,
      :type_location
    )
  end  
end
