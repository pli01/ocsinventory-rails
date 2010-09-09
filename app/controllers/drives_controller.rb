class DrivesController < ApplicationController
  # GET /drives
  # GET /drives.xml
  def index
    @drives = Drives.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @drives }
    end
  end

  # GET /drives/1
  # GET /drives/1.xml
  def show
    @drives = Drives.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @drives }
    end
  end

  # GET /drives/new
  # GET /drives/new.xml
  def new
    @drives = Drives.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @drives }
    end
  end

  # GET /drives/1/edit
  def edit
    @drives = Drives.find(params[:id])
  end

  # POST /drives
  # POST /drives.xml
  def create
    @drives = Drives.new(params[:drives])

    respond_to do |format|
      if @drives.save
        flash[:notice] = 'Drives was successfully created.'
        format.html { redirect_to(@drives) }
        format.xml  { render :xml => @drives, :status => :created, :location => @drives }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @drives.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /drives/1
  # PUT /drives/1.xml
  def update
    @drives = Drives.find(params[:id])

    respond_to do |format|
      if @drives.update_attributes(params[:drives])
        flash[:notice] = 'Drives was successfully updated.'
        format.html { redirect_to(@drives) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @drives.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /drives/1
  # DELETE /drives/1.xml
  def destroy
    @drives = Drives.find(params[:id])
    @drives.destroy

    respond_to do |format|
      format.html { redirect_to(drives_url) }
      format.xml  { head :ok }
    end
  end
end
