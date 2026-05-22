class Friend < ActiveRecord::Base
  
  mount_uploader :friend_image, FriendimageUploader
  mount_uploader :friend_image_thumb, FriendimageUploader
  
  validates_presence_of :friend_name, :friend_desc, :friend_image, :friend_slug, :friend_sortweight
  
  scope :ordered, -> {
    order(:friend_sortweight)
  }
  
  scope :published_public, -> {
    where(:friend_published => true)
    .order(:friend_sortweight)  
  }

  # Search
  scope :find_slug_public, -> (parm) {
      where("friend_slug = '#{parm}' AND friend_published = true")
      .order("friend_sortweight DESC") }  
  
  scope :search_public, -> (parm) {
      where("(UPPER(friend_name) like '%#{parm.upcase}%' OR UPPER(friend_desc) like '%#{parm.upcase}%') AND friend_published = true")
      .order("friend_sortweight DESC") }  
  
end
