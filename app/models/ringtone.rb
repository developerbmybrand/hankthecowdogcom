class Ringtone < ActiveRecord::Base

  mount_uploader :ringtone_audio, RingtoneUploader

  validates_presence_of :title

  scope :ordered, -> {
    order(:title)
  }

end
