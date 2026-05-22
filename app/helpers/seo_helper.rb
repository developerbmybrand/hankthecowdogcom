module SeoHelper
  SITE_HOST = "https://www.hankthecowdog.com".freeze
  DEFAULT_TITLE = "The Official Website of Hank the Cowdog".freeze
  DEFAULT_DESCRIPTION = "The official homepage of Hank the Cowdog. A series of humorous children's mystery novels, written by John R. Erickson and illustrated by Gerald L. Holmes.".freeze

  def canonical_url
    path = request.path
    path = "/" if path.blank?
    "#{SITE_HOST}#{path}"
  end

  def site_host_url(path = "/")
    "#{SITE_HOST}#{path}"
  end

  def seo_meta
    @seo_meta ||= begin
      path = request.path
      path = "/" if path.blank?
      SeoMeta.lookup(path)
    end
  end

  def seo_title
    seo_meta[:title] || DEFAULT_TITLE
  end

  def seo_description
    seo_meta[:description] || DEFAULT_DESCRIPTION
  end
end

class SeoMeta
  def self.config
    @config ||= YAML.load_file(Rails.root.join("config", "seo.yml"))
  end

  def self.lookup(path)
    entry = config[path]
    return {} unless entry
    { title: entry["title"], description: entry["description"] }
  end
end
