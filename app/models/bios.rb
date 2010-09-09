class Bios < ActiveRecord::Base
 set_table_name "bios"
 set_primary_key "ID"
 belongs_to :hardware
end
