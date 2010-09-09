class VirtualmachinesController < ApplicationController

  def index
	  @page_title = "VM inventory"
	  @virtualmachines = VMPool.paginate :page => params[:page], :per_page => 30

	  #    @virtualmachines = Virtualmachines.all

	  respond_to do |format|
		  format.html # index.html.erb
		  format.xml  { render :xml => @virtualmachines }
	  end
  end
end
