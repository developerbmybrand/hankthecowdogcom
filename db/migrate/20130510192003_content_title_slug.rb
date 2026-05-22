class ContentTitleSlug < ActiveRecord::Migration
  def self.up
    add_column :contents, :content_title_slug, :string
  end

  def self.down
    remove_column :contents, :content_title_slug
  end
end
