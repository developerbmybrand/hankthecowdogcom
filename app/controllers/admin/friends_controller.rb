class Admin::FriendsController < Admin::BaseController

  def index
    @friends = Friend.ordered

    respond_to do |format|
      format.html 
    end
  end

  def show
    @friend = Friend.find(params[:id])

    respond_to do |format|
      format.html 
    end
  end

  def new
    @friend = Friend.new
    @friend.friend_sortweight = 0
    
    respond_to do |format|
      format.html 
    end
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def create
    @friend = Friend.new(friends_parms)    
    @friend.friend_slug = params[:friend][:friend_name].to_url    

    respond_to do |format|
      if @friend.save
        format.html { redirect_to([:admin, @friend], :notice => 'Friend was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @friend = Friend.find(params[:id])

    respond_to do |format|
      if @friend.update_attributes(friends_parms)
        format.html { redirect_to([:admin, @friend], :notice => 'Friend was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    redirect_to('/admin/friends')
  end

  private
  def friends_parms
    params.require(:friend).permit(
      :friend_name,
      :friend_desc,
      :friend_image,
      :friend_image_thumb,
      :friend_slug,
      :friend_sortweight,
      :friend_published
    )
  end
end
