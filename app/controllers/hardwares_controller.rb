class HardwaresController < ApplicationController
#	active_scaffold :hardware

  # GET /hardwares
  # GET /hardwares.xml
  def index

    
    @page_title = "Hardware Inventory"

    #
    # @hardwares = Hardware.find(:all ,:include=>["storages","memory"],:conditions=>"id<100")
    #@name_list = Hardware.find(:all , :order => "NAME").map {|u| [u.NAME, u.ID] }
    @name_list = Hardware.all(:select => 'DISTINCT(NAME)' ).map {|u|  [u.NAME] }


#     @domain_list = Hardware.find(:all , :order => "WORKGROUP").map {|u|  [u.NAME+"."+u.WORKGROUP, u.NAME+"."+u.WORKGROUP] }
 
    @domain_list = Hardware.all(:select => 'DISTINCT(WORKGROUP)' ).map {|u|  [u.WORKGROUP] }

    # domainname = "toto.com"
    #    @domain_list = Hardware.find( :all,:conditions => [ "WORKGROUP = ?", domainname]  )
    #
    # recuperation  d'une liste de domaine (WORKGROUP)
    # pour creation d'une liste deroulante
    # puis selection uniquement de hardware.(le choix de la liste deroulante)
    #
    #
    # pagination et multi pages
    # @hardwares = Hardware.paginate :page => params[:page], :per_page => 30,:conditions=> "hardware.WORKGROUP='test'"
    # @hardwares = Hardware.paginate :page => params[:page], :per_page => 30, :conditions => ["WORKGROUP = ?",params[:ID] ]
#    domainname = "toto.com"
 #   @hardwares = Hardware.paginate :page => params[:page], :per_page => 30, :conditions => ["WORKGROUP = ?", domainname ]
    
    date = 29.year.ago

    unless params[:query][:domain].nil?
	    query = params[:query][:domain]
    end

    #conditions = ["workgroup LIKE ?", "%#{params[:query][:domain]}%"] unless params[:query].nil?
    conditions = ( query ) ? ["workgroup LIKE ? AND lastcome >= ?", "%#{query}%", date ] : [ "lastcome >= ?", date ]

    @hardwares = Hardware.paginate :page => params[:page],
	      :per_page => 20,
	      :conditions => conditions,
	      :order => 'name'
#    params[:query] = nil
 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hardwares }
    end
  end

  # GET /hardwares/1
  # GET /hardwares/1.xml
  def show
    @hardware = Hardware.find(params[:id],:include=>[memories])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hardware }
    end
  end

  # GET /hardwares/new
  # GET /hardwares/new.xml
  def new
    @hardware = Hardware.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hardware }
    end
  end

  # GET /hardwares/1/edit
  def edit
    @hardware = Hardware.find(params[:id])
  end

  # POST /hardwares
  # POST /hardwares.xml
  def create
    @hardware = Hardware.new(params[:hardware])

    respond_to do |format|
      if @hardware.save
        flash[:notice] = 'Hardware was successfully created.'
        format.html { redirect_to(@hardware) }
        format.xml  { render :xml => @hardware, :status => :created, :location => @hardware }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hardware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hardwares/1
  # PUT /hardwares/1.xml
  def update
    @hardware = Hardware.find(params[:id])

    respond_to do |format|
      if @hardware.update_attributes(params[:hardware])
        flash[:notice] = 'Hardware was successfully updated.'
        format.html { redirect_to(@hardware) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hardware.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hardwares/1
  # DELETE /hardwares/1.xml
  def destroy
    @hardware = Hardware.find(params[:id])
    @hardware.destroy

    respond_to do |format|
      format.html { redirect_to(hardwares_url) }
      format.xml  { head :ok }
    end
  end


end
