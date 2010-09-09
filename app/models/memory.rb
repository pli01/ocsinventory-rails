class Memory < ActiveRecord::Base
 set_table_name "memories"
 set_primary_key "ID"

  belongs_to :hardware 
end
