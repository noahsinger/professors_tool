class Admin::DivisionsController < ApplicationController
  before_filter :authenticate
  
  # GET /divisions
  # GET /divisions.xml
  def index
   xxx@xxx.xxx = Division.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /divisions/1
  # GET /divisions/1.xml
  def show
   xxx@xxx.xxx = Division.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /divisions/new
  # GET /divisions/new.xml
  def new
   xxx@xxx.xxx = Division.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /divisions/1/edit
  def edit
   xxx@xxx.xxx = Division.find(params[:id])
  end

  # POST /divisions
  # POST /divisions.xml
  def create
   xxx@xxx.xxx = Division.new(params[:division])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Division was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @division, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /divisions/1
  # PUT /divisions/1.xml
  def update
   xxx@xxx.xxx = Division.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Division was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /divisions/1
  # DELETE /divisions/1.xml
  def destroy
   xxx@xxx.xxx = Division.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { redirect_to(admin_divisions_url) }
      format.xml  { head :ok }
    end
  end
  
end
