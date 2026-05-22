class CreateScreenplaysActdetail < ActiveRecord::Migration
  def self.up
    add_column :screenplays, :screen_oneact, :text, :after => 'screen_songs'
  end

  def self.down
    remove_column :screenplays, :screen_oneact
  end
end
