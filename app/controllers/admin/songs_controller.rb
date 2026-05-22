class Admin::SongsController < Admin::BaseController

  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @song = Song.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to([:admin, @song], :notice => 'Song was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(song_params)
        format.html { redirect_to([:admin, @song], :notice => 'Song was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to(admin_songs_path)
  end

  private
  def song_params
    params.require(:song).permit(
      :title,
      :artist,
      :song_audio,
      :store_link_url
    )
  end
end
