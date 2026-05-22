module CarrierWave
  module RMagick

    # Reduces the quality of the image to the percentage given
    def quality(percentage)
      manipulate! do |img|
        img.write(current_path){ self.quality = percentage }
        img = yield(img) if block_given?
        img
      end
    end

  end
end

#Resource: http://blog.thefrontiergroup.com.au/2011/03/adding-additional-to-carrierwave/