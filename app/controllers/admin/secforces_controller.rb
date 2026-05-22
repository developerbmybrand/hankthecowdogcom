class Admin::SecforcesController < Admin::BaseController

  def index
    @secforce = Secforce.first
  end

  def update
    @secforce = Secforce.first
    @secforce.secforce_username = params[:secforce_username]

    unless params[:secforce_password] == ''
        @secforce.secforce_password = Digest::MD5.hexdigest(params[:secforce_password])
    end

    respond_to do |format|
      if @secforce.save!
        format.html { redirect_to('/admin/secforce', :notice => 'Credentials were successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

end