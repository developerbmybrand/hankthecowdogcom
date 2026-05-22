class Printout < ActiveRecord::Base

  mount_uploader :printout_image, PrintoutimageUploader
  mount_uploader :printout_filename, PrintoutfileUploader

  validates_presence_of :printout_name, :printout_description, :printout_image, :printout_filename

  scope :ordered, -> {
    order(:printout_name)
  }

end
