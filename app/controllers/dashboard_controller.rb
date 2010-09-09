# -*- coding: utf-8 -*-
class DashboardController < ApplicationController
  before_filter :conditions

  def index
    date = 29.year.ago
    conditions = [ "lastcome >= ?", date ]
    @page_title = "Dashboard"
    @host_per_domain=Hardware.count(:all, :group => "hardware.WORKGROUP", :conditions => conditions)
    @cpu_per_domain=Hardware.sum('PROCESSORN', :group => "hardware.WORKGROUP")
    @vm_per_domain=Hardware.count(:all, :joins => [:virtualmachine], :group => "hardware.WORKGROUP")
    @vcpu_per_domain=Hardware.sum('VCPU', :joins => [:virtualmachine], :group => "hardware.WORKGROUP")
    @processors_per_domain=Hardware.sum('PROCESSORS', :group => "hardware.WORKGROUP")
    @mem_capacity_per_domain=Hardware.sum('CAPACITY', :joins => [:memory], :group => "hardware.WORKGROUP")
    @memory_per_domain=Hardware.sum('MEMORY', :group => "hardware.WORKGROUP")
    @vmemory_per_domain=Hardware.sum('virtualmachines.MEMORY', :joins => [:virtualmachine], :group => "hardware.WORKGROUP")
    @disk_count_per_domain=Hardware.count('DISKSIZE', :joins => [:storages], :group => "hardware.WORKGROUP")
    @disk_per_domain=Hardware.sum('DISKSIZE', :joins => [:storages], :group => "hardware.WORKGROUP")
    #
    # ["tata.home", "titi.home", "tutu.home"]
    #
    domain_list =(@host_per_domain.keys).sort
    #
    # {0=>"tata.home", 1=>"titi.home", 2=>"tutu.home"}
    #
    @keys = Hash[*domain_list.collect {|v| [domain_list.index(v),v.to_s] }.flatten]
    #
    #keys.collect {|k,v| @host[v].nil? ? 0 : @host[v]}
    # [3, 1, 1]
    #
  end

  def index2
    @domain_list = Hardware.all(:select => 'DISTINCT(WORKGROUP)' )
    @data =        Hardware.find( :all, :select => 'distinct(WORKGROUP), MEMORY, PROCESSORN, OSNAME' ) 
    @os_count = Hardware.count_distribution :osname
    @total_hosts = Hardware.count
    @interval = 3  # the run interval to show in the dashboard graph
  end

  def generate_with_y_axis_increment(increment=1)
        g=line_graph("toto")
    g.title = "Y Axis Set to #{increment}"
    g.labels = {
      0 => '5/6', 
      1 => '5/15', 
      2 => '5/24', 
      3 => '5/30', 
      4 => '5/30', 
    }
    g.y_axis_increment = increment
 
    g.data(:apples, [1, 0.2, 0.5, 0.7])
    g.data(:peaches, [2.5, 2.3, 2, 6.1])
    send_data(g.to_blob, 
              :disposition => 'inline', 
              :type => 'image/png')

  end




  # Send a graph to the browser
  def line_graph_report
    g=line_graph("toto")
    g.x_axis_label = "Domaine"
    g.y_axis_label = 'Nb VM'
    g.title = "host repartition" 
    @data=Hardware.sum('virtualmachines.MEMORY', :joins => [:virtualmachine], :group => "hardware.WORKGROUP")
    # @data=Hardware.count_distribution :workgroup
    g.labels = { 0 => 'Mon', 1 => 'Wed', 2 => 'Fri', 3 => 'Sun' }
    # g.y_axis_increment = 10
    @data.sort.each do |d|
      g.data(d[0],d[1])
    end
    g.minimum_value = 0
    
    send_data(g.to_blob, 
              :disposition => 'inline', 
              :type => 'image/png')

  end
  
  def pie_graph_report
    #          g = Gruff::Bar.new(300)
    #g = Gruff::Pie.new(400)    
    g = Gruff::Pie.new(400)    
    g.title = "Scores for Bart" 

    #	  g.font = File.expand_path('artwork/fonts/Vera.ttf', RAILS_ROOT)
    #g.data("Oranges", [4, 8, 7, 9, 8, 9])
    #g.data("Watermelon", [2, 3, 1, 5, 6, 8])
    # g.data("Free", 20)
    # g.data("Used", 80)
    #	  g.labels = { 0 => 'Mon', 2 => 'Wed', 4 => 'Fri', 6 => 'Sun' }
    
    #    g.labels = { 0 => 'xen01',2 => 'xen02' }
    # @data=Hardware.count_distribution :osname
    # @data=Hardware.count_distribution :osname
    @data=Hardware.count_distribution :workgroup
    
    @data.each do |d|
      g.data(d[0],d[1])
    end

    # Modify this to represent your actual data models
    #	  @data = Data.find(:all)
    #	  @data.each do |d|
    # Build data into array with something like
    # built_array = d.collect { |e| e.some_number_field.to_f }
    #		  g.data(some_label, built_array)
    #	  end
    g.theme_greyscale
    #    	  g.theme = {
    #		  :colors => %w(orange purple green white red),
    #		  :marker_color => 'red',
    #		  :background_colors => %w(green white)
    #	  }

    # g.legend_font_size = 14
    # g.marker_font_size = 14
    
    send_data(g.to_blob, 
              :disposition => 'inline', 
              :type => 'image/png')
  end
  
  protected

  def line_graph(title="test")
    g = Gruff::Bar.new(300)
    g.theme_pastel
    g.title = title
    g
  end
 

  private
  def conditions
    time = Time.now.utc - 35.minutes
    @host_conditions = ["puppet_status > ?", 0]
  end
  
  def to_hash_keys(&block)
    Hash[*self.collect { |v|
           [v, block.call(v)]
         }.flatten]
  end

  def to_hash_values(&block)
    Hash[*self.collect { |v|
           [block.call(v), v]
         }.flatten]
  end
  
  
end
