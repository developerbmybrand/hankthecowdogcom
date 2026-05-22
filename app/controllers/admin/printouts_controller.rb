class Admin::PrintoutsController < Admin::BaseController

  def index
    @printouts = Printout.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @printout = Printout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @printout = Printout.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @printout = Printout.find(params[:id])
  end

  def create
    @printout = Printout.new(printout_params)

    respond_to do |format|
      if @printout.save
        format.html { redirect_to([:admin, @printout], :notice => 'Printout was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @printout = Printout.find(params[:id])

    respond_to do |format|
      if @printout.update_attributes(printout_params)
        format.html { redirect_to([:admin, @printout], :notice => 'Printout was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @printout = Printout.find(params[:id])
    @printout.destroy

    respond_to do |format|
      format.html { redirect_to(admin_printouts_url) }
    end
  end

  private
  def printout_params
    params.require(:printout).permit(
      :printout_name,
      :printout_description,
      :printout_image,
      :printout_filename
    )
  end
end
