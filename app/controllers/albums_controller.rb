class AlbumsController < ApplicationController
  # GET /albums
  # GET /albums.xml
    layout 'standard'
    
    before_filter :authorize, :except => [:index, :show, :bestverkocht, :bestrating, :nieuwe, :uitgelicht]
    
  def index
    @albums = Album.find(:all)
    @listnav = true
    @pagetitle = 'Alle albums'
    respond_to do |format|
      format.html
      format.xml  { render :xml => @albums }
    end
  end
  
  def nieuwe
    @albums = Album.all(:order =>"jaar DESC", :limit => 10)
    @listnav = false
    @pagetitle = 'Nieuwe albums'
    respond_to do |format|
      format.html { render :action => :index }
      format.xml  { render :xml => @albums }
    end
  end
  
  def bestverkocht
    @albums = Album.all.sort_by { |a| a.aankoops.count }.reverse[0..9]
    @listnav = false
    @pagetitle = 'Best verkochte albums'

    respond_to do |format|
      format.html { render :action => :index }
      format.xml  { render :xml => @albums }
    end
  end
  
  def bestrating
    @albums = Album.all.sort_by { |a| 
        x = a.commentaars.average(:rating)
        if x.nil?
          0
        else
          x
        end
    }.reverse[0..9]
    @listnav = false
    @pagetitle = 'Hoogst gewaardeerde albums'

    respond_to do |format|
      format.html { render :action => :index }
      format.xml  { render :xml => @albums }
    end
  end

  def uitgelicht
    @albums = Uitgelicht.all.collect { |u| u.album }
    @listnav = false
    @pagetitle = 'Uitgelichte albums'

    respond_to do |format|
      format.html
      format.xml  { render :xml => @albums } 
    end
  end
  
  # GET /albums/1
  # GET /albums/1.xml
  def show
    @album = Album.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.xml
  def new
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.xml
  def create
    @album = Album.new(params[:album])

    respond_to do |format|
      if @album.save
        flash[:notice] = 'Album was successfully created.'
        format.html { redirect_to(@album) }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.xml
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        flash[:notice] = 'Album was successfully updated.'
        format.html { redirect_to(@album) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.xml
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to(albums_url) }
      format.xml  { head :ok }
    end
  end
end
