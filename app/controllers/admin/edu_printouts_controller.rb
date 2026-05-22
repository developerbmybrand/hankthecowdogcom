class Admin::EduPrintoutsController < Admin::BaseController

  def index
    @printouts = EduPrintout.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @printout = EduPrintout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @printout = EduPrintout.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @printout = EduPrintout.find(params[:id])
  end

  def create
    @printout = EduPrintout.new(print_parms)

    respond_to do |format|
      if @printout.save
        format.html { redirect_to([:admin, @printout], :notice => 'Printout was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @printout = EduPrintout.find(params[:id])

    respond_to do |format|
      if @printout.update_attributes(print_parms)
        format.html { redirect_to([:admin, @printout], :notice => 'Printout was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @printout = EduPrintout.find(params[:id])
    @printout.destroy

    respond_to do |format|
      format.html { redirect_to(admin_edu_printouts_url) }
    end
  end

  private
  def print_parms
    params.require(:edu_printout).permit(
      :printout_name,
      :printout_description,
      :printout_image,
      :printout_filename
    )
  end
end
