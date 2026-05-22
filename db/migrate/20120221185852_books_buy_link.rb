class BooksBuyLink < ActiveRecord::Migration
  def self.up
    add_column :books, :book_linkcd, :string, :after => 'book_linkaudible'
  end

  def self.down
    remove_column :books, :book_linkcd
  end
end
