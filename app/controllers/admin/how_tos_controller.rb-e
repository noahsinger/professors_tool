class Admin::HowTosController < ApplicationController
  before_filter :authenticate
  
  before_filter :store_referrer
  
  def store_referrer
    unless session[:referrer]
      session[:referrer] = request.referrer
    end
  end
  
  # GET /how_tos
  # GET /how_tos.xml
  def index
   xxx@xxx.xxx = HowTo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /how_tos/1
  # GET /how_tos/1.xml
  def show
   xxx@xxx.xxx = HowTo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /how_tos/new
  # GET /how_tos/new.xml
  def new    
   xxx@xxx.xxx = HowTo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /how_tos/1/edit
  def edit
   xxx@xxx.xxx = HowTo.find(params[:id])
  end

  # POST /how_tos
  # POST /how_tos.xml
  def create
   xxx@xxx.xxx = HowTo.new(params[:how_to])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'HowTo was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @how_to, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /how_tos/1
  # PUT /how_tos/1.xml
  def update
   xxx@xxx.xxx = HowTo.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'HowTo was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /how_tos/1
  # DELETE /how_tos/1.xml
  def destroy
   xxx@xxx.xxx = HowTo.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { redirect_to(admin_how_tos_url) }
      format.xml  { head :ok }
    end
  end
end
