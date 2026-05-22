class Screenplay < ActiveRecord::Base
  
  mount_uploader :screen_image, ScreenimageUploader
  
  validates_presence_of :screen_title, :screen_desc, :screen_story, :screen_characters
  
  scope :ordered_public, -> (parm) {
    where("screen_published = true")
    .order(parm || "created_at DESC")
    .order(:screen_sortweight)
  }

  scope :find_id_public, -> (parm) {
    return where("1=0") unless parm.to_s.match(/\A\d+\z/)
    where(id: parm.to_i, screen_published: true)
  }
  
  scope :search_public, -> (parm) {
      where("(UPPER(screen_title) like '%#{parm.upcase}%' OR UPPER(screen_desc) like '%#{parm.upcase}%') AND screen_published = true")
      .order("screen_sortweight DESC") 
  }
  
end
