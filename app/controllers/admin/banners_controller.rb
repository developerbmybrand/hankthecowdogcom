class Admin::BannersController < Admin::BaseController
  def index
    @banners = Banner.ordered

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @banner = Banner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @banner = Banner.new
    @banner.banner_sortweight = 0
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def create
    @banner = Banner.new(banner_parms)

    respond_to do |format|
      if @banner.save
        format.html { redirect_to([:admin, @banner], :notice => 'Banner was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @banner = Banner.find(params[:id])

    respond_to do |format|
      if @banner.update_attributes(banner_parms)
        format.html { redirect_to([:admin, @banner], :notice => 'Banner was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    redirect_to('/admin/banners')
  end

  private
  def banner_parms
    params.require(:banner).permit(:banner_title, :banner_link, :banner_image, :banner_sortweight, :banner_published)
  end
end
