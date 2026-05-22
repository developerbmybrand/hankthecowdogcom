class Admin::RecipesController < Admin::BaseController

  def index
    @recipes = Recipe.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @recipe = Recipe.new
    @recipe.recipe_sortweight = 0

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_parms)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to([:admin, @recipe], :notice => 'Recipe was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(recipe_parms)
        format.html { redirect_to([:admin, @recipe], :notice => 'Recipe was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to('/admin/recipes')
  end

  private
  def recipe_parms
    params.require(:recipe).permit(
      :recipe_title,
      :recipe_desc,
      :recipe_image,
      :recipe_sortweight,
      :recipe_published,
      :recipe_subtitle
    )
  end
end
