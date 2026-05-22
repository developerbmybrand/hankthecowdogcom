# Serve S3/Fog asset URLs over HTTPS (fixes mixed-content audit findings).
module CarrierWaveHttpsUrls
  def url(*args)
    original = super
    return original if original.blank?
    original.to_s.sub(/\Ahttp:\/\//i, "https://")
  end
end

CarrierWave::Uploader::Base.prepend(CarrierWaveHttpsUrls)
