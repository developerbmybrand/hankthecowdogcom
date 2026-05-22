class Admin::ContentsController < Admin::BaseController  

  def index
    sort_params = { "by_page" => "type_content_pages.type_name",
                    "by_title" => "content_title",
                    }
    @contents = Content.ordered(sort_params[params[:sort]])

    respond_to do |format|
      format.html 
    end
  end

  def show
    @content = Content.find(params[:id])

    respond_to do |format|
      format.html 
    end
  end

  def new
    @content = Content.new

    respond_to do |format|
      format.html 
    end
  end

  def edit
    @content = Content.find(params[:id])
  end

  def create
    @content = Content.new(content_parms)

    respond_to do |format|
      if @content.save
        format.html { redirect_to([:admin, @content], :notice => 'Content was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @content = Content.find(params[:id])

    respond_to do |format|
      if @content.update_attributes(content_parms)
        format.html { redirect_to([:admin, @content], :notice => 'Content was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy

    redirect_to('/admin/contents')
  end

  private 
  def content_parms
    params.require(:content).permit(
      :type_content_page_id, 
      :content_title,
      :content_text,
      :content_published,
      :created_at,
      :updated_at,
      :content_image,
      :content_title_slug
    )
  end
end
