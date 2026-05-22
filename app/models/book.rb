class Book < ActiveRecord::Base
  
  mount_uploader :book_image, BookimageUploader
  mount_uploader :book_audio, BookaudioUploader

  validates_presence_of :book_title, :book_desc, :book_volume_number, :book_image, :book_link, :book_sortweight
  
  scope :ordered, -> (type) { order(type || 'created_at DESC') }

  # Search
  scope :find_id_public, -> (parm) {
    return where("1=0") unless parm.to_s.match(/\A\d+\z/)
    where(id: parm.to_i, book_published: true)
  }

  scope :ordered_public, -> (parm) {
    where("book_published = true")
    .order(parm || "created_at DESC")
    .order(:book_sortweight)}

  scope :featured, -> {
    where(:book_featured => true)
  }
  
  scope :search_public, -> (parm) {
      where("(UPPER(book_title) like '%#{parm.upcase}%' OR UPPER(book_desc) like '%#{parm.upcase}%') AND book_published = true")
      .order("book_sortweight DESC") }  
  
end
