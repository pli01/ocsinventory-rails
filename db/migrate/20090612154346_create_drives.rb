class CreateDrives < ActiveRecord::Migration
  def self.up
    create_table :drives do |t|
      t.integer :TOTAL
      t.integer :FREE
      t.string :FILESYSTEM
      t.t.string :TYPE
      t.integer :HARDWARE_ID

      t.timestamps
    end
  end

  def self.down
    drop_table :drives
  end
end
