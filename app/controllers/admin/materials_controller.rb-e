class Admin::MaterialsController < ApplicationController
  before_action :authenticate
  
  before_action :load_course
  
  def load_course
   xxx@xxx.xxx = Course.find( params[:course_id] )
  end
  
  # GET /materials
  # GET /materials.xml
  def index
    @materials xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /materials/new
  # GET /materials/new.xml
  def new
    @material xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /materials/1/edit
  def edit
    @material xxx@xxx.xxx
  end

  # POST /materials
  # POST /materials.xml
  def create
    @material xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Material was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render xml: @material, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /materials/1
  # PUT /materials/1.xml
  def update
    @material xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Material was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "edit" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.xml
  def destroy
   xxx@xxx.xxx = Material.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      @status = xxx@xxx.xxx
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:material).permit(:file, :title, :description)
  end
end
