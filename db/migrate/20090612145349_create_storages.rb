class CreateStorages < ActiveRecord::Migration
  def self.up
    create_table :storages do |t|
      t.integer :DISKSIZE
      t.string :TYPE
      t.integer :HARDWARE_ID

      t.timestamps
    end
  end

  def self.down
    drop_table :storages
  end
end
