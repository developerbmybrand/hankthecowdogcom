class Banner < ActiveRecord::Base
  
  mount_uploader :banner_image, BannerimageUploader

  validates_presence_of :banner_title, :banner_link, :banner_image, :banner_sortweight
  
  scope :ordered, -> {
      order(:banner_sortweight)
    }
  
  scope :published, -> {
       where(:banner_published => true)
      .order(:banner_sortweight)
    }   
      
  scope :ordered_public, -> (type) { 
      where("banner_published = true")
      .order(args.first || "created_at DESC")
  }

end
