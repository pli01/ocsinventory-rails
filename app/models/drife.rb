class Drife < ActiveRecord::Base
 set_table_name "drives"
 set_primary_key "ID"
 belongs_to :hardware
end
