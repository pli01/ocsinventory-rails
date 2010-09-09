class CreateVirtualmachines < ActiveRecord::Migration
  def self.up
    create_table :virtualmachines do |t|
      t.string :NAME

      t.timestamps
    end
  end

  def self.down
    drop_table :virtualmachines
  end
end
