class CreatePrintouts < ActiveRecord::Migration
  def self.up
    create_table :printouts do |t|
      t.string :printout_name
      t.string :printout_description
      t.string :printout_image
      t.string :printout_filename

      t.timestamps
    end
  end

  def self.down
    drop_table :printouts
  end
end
