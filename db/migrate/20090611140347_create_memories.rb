class CreateMemories < ActiveRecord::Migration
  def self.up
    create_table :memories do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :memories
  end
end
