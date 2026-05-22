class Content < ActiveRecord::Base
  
  belongs_to :type_content
  belongs_to :type_content_page

  before_save :update_slug

  mount_uploader :content_image, ContentimageUploader

  validates_presence_of :content_title, :content_text
  #validates_format_of :content_title, :with => /^[-A-Za-z0-9]+$/, :message => 'is not valid.  Only letters and numbers are allowed.  No spaces are allowed.'
  
  scope :ordered, -> (parm) {
    joins(:type_content_page)
    .order(parm || 'created_at DESC') }
  
  # Search
  scope :search_public, -> (parm) {
    joins(:type_content_page)
    .where("(UPPER(content_title) like '%#{parm.upcase}%' OR UPPER(content_text) like '%#{parm.upcase}%')
           AND content_published = true")
    .order("created_at DESC") }
  
  scope :ordered_public, -> (parm) {
    where("content_published = true")
    .order(parm || "created_at DESC")}

  def update_slug
    self.content_title_slug = self.content_title.to_url
  end

end

