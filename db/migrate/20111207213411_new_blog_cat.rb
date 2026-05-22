class NewBlogCat < ActiveRecord::Migration
  def self.up
    TypeBlogCategory.create(:type_name => 'News')
  end

  def self.down
  end
end
