class Newsletter < ActiveRecord::Base

  mount_uploader :newsletter_path, NewsletterUploader

  scope :published, -> {
    where(:newsletter_published => true)
      .order("newsletter_date DESC")
  }

end
