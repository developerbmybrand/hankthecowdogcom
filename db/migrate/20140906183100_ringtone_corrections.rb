class RingtoneCorrections < ActiveRecord::Migration
  def self.up

    remove_column :ringtones, :store_link_url
    remove_column :ringtones, :artist

  end

  def self.down

    add_column :ringtones, :store_link_url, :string
    add_column :ringtones, :artist, :string

  end
end
