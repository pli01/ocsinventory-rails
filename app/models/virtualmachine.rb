class Virtualmachine < ActiveRecord::Base
 set_table_name "virtualmachines"
 set_primary_key "ID"
 belongs_to :hardware

 def self.isrunning
	 find(:all, :conditions => "status = 'off'")
 end

  def hosted_on
    Hardware.find(virtualmachines.HARDWARE_ID, :select   => "NAME").NAME+"."+Hardware.find(virtualmachines.HARDWARE_ID, :select  => "WORKGROUP").WORKGROUP
  end

end
