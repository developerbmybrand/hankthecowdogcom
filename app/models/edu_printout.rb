class EduPrintout < ActiveRecord::Base

  mount_uploader :printout_image, EduprintoutimageUploader
  mount_uploader :printout_filename, EduprintoutfileUploader

  validates_presence_of :printout_name, :printout_description, :printout_filename

  scope :ordered, -> {
    order(:printout_name)
  }

end
