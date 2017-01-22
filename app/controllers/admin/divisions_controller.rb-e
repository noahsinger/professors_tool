class Admin::DivisionsController < ApplicationController
  before_action :authenticate
  
  # GET /divisions
  # GET /divisions.xml
  def index
   xxx@xxx.xxx = Division.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /divisions/new
  # GET /divisions/new.xml
  def new
   xxx@xxx.xxx = Division.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /divisions/1/edit
  def edit
   xxx@xxx.xxx = Division.find(params[:id])
  end

  # POST /divisions
  # POST /divisions.xml
  def create
   xxx@xxx.xxx = Division.new(allowed_params)

    respond_to do |format|
      xxx@xxx.xxx
       xxx@xxx.xxx = admin_divisions_url
        flash[:notice] = 'Division was successfully created.'
        format.html { redirect_to(admin_divisions_url) }
        format.xml  { render xml: @division, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /divisions/1
  # PUT /divisions/1.xml
  def update
   xxx@xxx.xxx = Division.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
       xxx@xxx.xxx = admin_divisions_url
        flash[:notice] = 'Division was successfully updated.'
        format.html { redirect_to(admin_divisions_url) }
        format.xml  { head :ok }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "edit" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /divisions/1
  # DELETE /divisions/1.xml
  def destroy
   xxx@xxx.xxx = Division.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
     xxx@xxx.xxx = admin_divisions_url
      format.html { redirect_to(admin_divisions_url) }
      format.xml  { head :ok }
      format.js
    end
  end

  def allowed_params
    params.require(:division).permit(:name, :phone_number, :office_number, :associate_dean)
  end 
end
