class EduPrintouts < ActiveRecord::Migration
  def self.up

    create_table :edu_printouts do |t|
      t.string   "printout_name"
      t.string   "printout_description"
      t.string   "printout_image"
      t.string   "printout_filename"
      t.timestamps
    end

  end

  def self.down

    drop_table :edu_printouts

  end
end
