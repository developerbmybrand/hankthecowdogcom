class Admin::RingtonesController < Admin::BaseController

  def index
    @ringtones = Ringtone.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @ringtone = Ringtone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @ringtone = Ringtone.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @ringtone = Ringtone.find(params[:id])
  end

  def create
    @ringtone = Ringtone.new(ringtone_params)

    respond_to do |format|
      if @ringtone.save
        format.html { redirect_to([:admin, @ringtone], :notice => 'Ringtone was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @ringtone = Ringtone.find(params[:id])

    respond_to do |format|
      if @ringtone.update_attributes(ringtone_params)
        format.html { redirect_to([:admin, @ringtone], :notice => 'Ringtone was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @ringtone = Ringtone.find(params[:id])
    @ringtone.destroy

    redirect_to(admin_ringtones_path)
  end

  private
  def ringtone_params
    params.require(:ringtone).permit(
      :title,
      :ringtone_audio
    )
  end
end
