class Admin::ScreenplaysController < Admin::BaseController

  def index
    @screenplays = Screenplay.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @screenplay = Screenplay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @screenplay = Screenplay.new
    @screenplay.screen_sortweight = 0

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @screenplay = Screenplay.find(params[:id])
  end

  def create
    @screenplay = Screenplay.new(screenplay_params)

    respond_to do |format|
      if @screenplay.save
        format.html { redirect_to([:admin, @screenplay], :notice => 'Screenplay was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @screenplay = Screenplay.find(params[:id])

    respond_to do |format|
      if @screenplay.update_attributes(screenplay_params)
        format.html { redirect_to([:admin, @screenplay], :notice => 'Screenplay was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @screenplay = Screenplay.find(params[:id])
    @screenplay.destroy

    redirect_to('/admin/screenplays')
  end

  private
  def screenplay_params
    params.require(:screenplay).permit(
      :screen_title,
      :screen_desc,
      :screen_image,
      :screen_characters,
      :screen_story,
      :screen_songs,
      :screen_sortweight,
      :screen_published,
      :screen_oneact
    )
  end
end
