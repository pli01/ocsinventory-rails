class VirtualmachinesController < ApplicationController

  def periodic
    #
  end
  
  # execution d'une commande
  # ajax dans layout
  def ps
    render(:text => "<pre>" + CGI::escapeHTML(`sudo virsh dumpxml QEMUGuest1`) + "</pre>")
    redirect_to_index_path
  end

  # GET /virtualmachines
  # GET /virtualmachines.xml
  def running
	  @vm_running = Virtualmachine.isrunning
  end

  def index
	  @page_title = "VM inventory"
	  @vm_running = Virtualmachine.isrunning
	  @virtualmachines = Virtualmachine.paginate :page => params[:page], :per_page => 30

	  #    @virtualmachines = Virtualmachines.all

	  respond_to do |format|
		  format.html # index.html.erb
		  format.xml  { render :xml => @virtualmachines }
	  end
  end

  # GET /virtualmachines/1
  # GET /virtualmachines/1.xml
  def show
    @virtualmachines = Virtualmachine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @virtualmachines }
    end
  end

  # GET /virtualmachines/new
  # GET /virtualmachines/new.xml
  def new
    @virtualmachines = Virtualmachine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @virtualmachines }
    end
  end

  # GET /virtualmachines/1/edit
  def edit
    @virtualmachines = Virtualmachine.find(params[:id])
  end

  # POST /virtualmachines
  # POST /virtualmachines.xml
  def create
    @virtualmachines = Virtualmachine.new(params[:virtualmachines])

    respond_to do |format|
      if @virtualmachines.save
        flash[:notice] = 'Virtualmachines was successfully created.'
        format.html { redirect_to(@virtualmachines) }
        format.xml  { render :xml => @virtualmachines, :status => :created, :location => @virtualmachines }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @virtualmachines.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /virtualmachines/1
  # PUT /virtualmachines/1.xml
  def update
    @virtualmachines = Virtualmachine.find(params[:id])

    respond_to do |format|
      if @virtualmachines.update_attributes(params[:virtualmachines])
        flash[:notice] = 'Virtualmachines was successfully updated.'
        format.html { redirect_to(@virtualmachines) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @virtualmachines.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /virtualmachines/1
  # DELETE /virtualmachines/1.xml
  def destroy
    @virtualmachines = Virtualmachine.find(params[:id])
    @virtualmachines.destroy

    respond_to do |format|
      format.html { redirect_to(virtualmachines_url) }
      format.xml  { head :ok }
    end
  end
end
