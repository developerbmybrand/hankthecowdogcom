class Song < ActiveRecord::Base

  mount_uploader :song_audio, SongUploader

  validates_presence_of :title, :artist

  scope :ordered, -> {
    order(:title)
  }

end
