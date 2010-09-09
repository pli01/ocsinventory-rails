class Storage < ActiveRecord::Base
 set_table_name "storages"
 set_primary_key "ID"
 belongs_to :hardware
end
