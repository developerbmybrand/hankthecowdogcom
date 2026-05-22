class RingtonesSongs < ActiveRecord::Migration
  def self.up

    create_table :ringtones do |t|
      t.string :title
      t.string :artist
      t.string :ringtone_audio
      t.string :store_link_url

      t.timestamps
    end

    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :song_audio
      t.string :store_link_url

      t.timestamps
    end

  end

  def self.down

    drop_table :ringtones
    drop_table :songs

  end
end
