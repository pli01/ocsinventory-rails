require 'util/inventory'

class Hardware < ActiveRecord::Base
  set_table_name "hardware"
  set_primary_key "ID"

  has_many :storages,      :foreign_key=>"HARDWARE_ID"
  has_many :memory,        :foreign_key=>"HARDWARE_ID"
  has_many :drife,         :foreign_key=>"HARDWARE_ID"
  has_many :virtualmachine,:foreign_key=>"HARDWARE_ID"
  has_many :networks,      :foreign_key=>"HARDWARE_ID"
  has_many :bios,          :foreign_key=>"HARDWARE_ID"

  def mem_size
    return memory.sum("CAPACITY")
  end

  def vm_count
    return virtualmachine.count
  end
  
  def mem_allocated_for_vm
    return virtualmachine.sum("MEMORY")
  end

  def mem_available
    return (self.mem_size.to_i-(self.mem_allocated_for_vm.to_i).abs)
  end

  
  # counts each association of a given host
  # e.g. how many hosts belongs to each os
  # returns sorted hash
  def self.count_distribution association
    output = {}
    count(:group => association).each {|k,v| output[k.to_s] = v unless v == 0 }
    output
  end

end
