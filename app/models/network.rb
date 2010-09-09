class Network < ActiveRecord::Base
 set_table_name "networks"
 set_primary_key "ID"
 belongs_to :hardware
end
