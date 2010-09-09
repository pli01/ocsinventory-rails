class MemoriesController < ApplicationController
  # GET /memories
  # GET /memories.xml
  def index
    @memories = Memories.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @memories }
    end
  end

  # GET /memories/1
  # GET /memories/1.xml
  def show
    @memories = Memories.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @memories }
    end
  end

  # GET /memories/new
  # GET /memories/new.xml
  def new
    @memories = Memories.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @memories }
    end
  end

  # GET /memories/1/edit
  def edit
    @memories = Memories.find(params[:id])
  end

  # POST /memories
  # POST /memories.xml
  def create
    @memories = Memories.new(params[:memories])

    respond_to do |format|
      if @memories.save
        flash[:notice] = 'Memories was successfully created.'
        format.html { redirect_to(@memories) }
        format.xml  { render :xml => @memories, :status => :created, :location => @memories }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @memories.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /memories/1
  # PUT /memories/1.xml
  def update
    @memories = Memories.find(params[:id])

    respond_to do |format|
      if @memories.update_attributes(params[:memories])
        flash[:notice] = 'Memories was successfully updated.'
        format.html { redirect_to(@memories) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @memories.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /memories/1
  # DELETE /memories/1.xml
  def destroy
    @memories = Memories.find(params[:id])
    @memories.destroy

    respond_to do |format|
      format.html { redirect_to(memories_url) }
      format.xml  { head :ok }
    end
  end
end
