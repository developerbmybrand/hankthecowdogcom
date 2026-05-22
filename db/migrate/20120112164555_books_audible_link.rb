class BooksAudibleLink < ActiveRecord::Migration
  def self.up
    add_column :books, :book_linkaudible, :string, :after => 'book_link'
    TypeContentPage.create(:type_name => 'Inner Sidebar', :type_location => 'sidebar')
  end

  def self.down
    remove_column :books, :book_linkaudible
    TypeContentPage.find_by_type_name('Inner Sidebar').delete
  end
end
