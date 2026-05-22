class Admin::UsersController < Admin::BaseController

  def index    
    @users = User.all

    respond_to do |format|
      format.html 
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def edit
    @user = User.find(params[:id])
    @user.password = ''
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = Digest::MD5.hexdigest(params[:user][:password])
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]

    respond_to do |format|
      if @user.save
        format.html { redirect_to([:admin, @user], :notice => 'User was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    @user.email = params[:user][:email]
    @user.password = Digest::MD5.hexdigest(params[:user][:password]) unless params[:user][:password] == ''
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]

    respond_to do |format|
      if @user.save
        format.html { redirect_to('/admin/users', :notice => 'User was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to('/admin/users')
  end
end
