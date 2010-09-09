class StoragesController < ApplicationController
  # GET /storages
  # GET /storages.xml
  def index
#    @storages = Storages.all
@storages = Storage.paginate :page => params[:page], :per_page => 30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @storages }
    end
  end

  # GET /storages/1
  # GET /storages/1.xml
  def show
    @storages = Storages.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @storages }
    end
  end

  # GET /storages/new
  # GET /storages/new.xml
  def new
    @storages = Storages.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @storages }
    end
  end

  # GET /storages/1/edit
  def edit
    @storages = Storages.find(params[:id])
  end

  # POST /storages
  # POST /storages.xml
  def create
    @storages = Storages.new(params[:storages])

    respond_to do |format|
      if @storages.save
        flash[:notice] = 'Storages was successfully created.'
        format.html { redirect_to(@storages) }
        format.xml  { render :xml => @storages, :status => :created, :location => @storages }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @storages.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /storages/1
  # PUT /storages/1.xml
  def update
    @storages = Storages.find(params[:id])

    respond_to do |format|
      if @storages.update_attributes(params[:storages])
        flash[:notice] = 'Storages was successfully updated.'
        format.html { redirect_to(@storages) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @storages.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /storages/1
  # DELETE /storages/1.xml
  def destroy
    @storages = Storages.find(params[:id])
    @storages.destroy

    respond_to do |format|
      format.html { redirect_to(storages_url) }
      format.xml  { head :ok }
    end
  end
end
