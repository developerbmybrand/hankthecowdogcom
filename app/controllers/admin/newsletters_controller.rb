class Admin::NewslettersController < Admin::BaseController

  def index
    @newsletters = Newsletter.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @newsletter = Newsletter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @newsletter = Newsletter.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def create
    @newsletter = Newsletter.new(newsletter_parms)

    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to([:admin, @newsletter], :notice => 'Newsletter was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @newsletter = Newsletter.find(params[:id])

    respond_to do |format|
      if @newsletter.update_attributes(newsletter_parms)
        format.html { redirect_to([:admin, @newsletter], :notice => 'Newsletter was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy

    respond_to do |format|
      format.html { redirect_to(admin_newsletters_url) }
    end
  end

  private
  def newsletter_parms
    params.require(:newsletter).permit(
      :newsletter_name,
      :newsletter_date,
      :newsletter_path,
      :newsletter_published
    )
  end
end
