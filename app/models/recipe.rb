class Recipe < ActiveRecord::Base
  
  mount_uploader :recipe_image, RecipeimageUploader

  validates_presence_of :recipe_title, :recipe_subtitle, :recipe_desc

  scope :ordered, -> (parm) {
    order(parm || 'created_at DESC')
  }
  
  scope :ordered_public, -> {
    where("recipe_published = true")
    .order("created_at DESC")
    .order(:recipe_sortweight)}

  scope :find_id_public, -> (parm) {
    return where("1=0") unless parm.to_s.match(/\A\d+\z/)
    where(id: parm.to_i, recipe_published: true)
  }

  scope :search_public, -> (parm) {
      where("(UPPER(recipe_title) like '%#{parm.upcase}%' OR UPPER(recipe_desc) like '%#{parm.upcase}%') AND recipe_published = true")
      .order("recipe_sortweight DESC") 
  }  
  
end
