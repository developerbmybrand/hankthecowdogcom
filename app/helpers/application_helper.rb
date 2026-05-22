module ApplicationHelper
  def https_url(url)
    return url if url.blank?
    url.to_s.sub(/\Ahttp:\/\//i, "https://")
  end
end
