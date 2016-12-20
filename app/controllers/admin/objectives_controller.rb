class Admin::ObjectivesController < ApplicationController
  before_action :authenticate
  before_action :load_course
  
  def load_course
   xxx@xxx.xxx = Course.find( params[:course_id] )
  end
  
  # GET /objectives
  # GET /objectives.xml
  def index
    @objectives xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /objectives/new
  # GET /objectives/new.xml
  def new
    @objective xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /objectives/1/edit
  def edit
    @objective xxx@xxx.xxx
  end

  # POST /objectives
  # POST /objectives.xml
  def create
    @objective xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Objective was successfully created.'
        format.html { xxx@xxx.xxx }
        format.js
        format.xml  { render xml: @objective, status: :created, xxx@xxx.xxx }
      else
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
    end
  end

  # PUT /objectives/1
  # PUT /objectives/1.xml
  def update
    @objective xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Objective was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render action: "edit" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
    end
  end
  
  def sort
   xxx@xxx.xxx do |objective|
      if position = params[:objectives].index(objective.id.to_s)
        objective.update_attribute(:position, position + 1) unless objective.position == position + 1
      end
    end
    
    respond_to do |format|
      format.html { render nothing: true, status: 200 }
      format.js
      format.xml  { head :ok }
    end
  end
  
  # DELETE /objectives/1
  # DELETE /objectives/1.xml
  def destroy
   xxx@xxx.xxx = Objective.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
    end
  end
  
  def allowed_params
    params.require(:objective).permit(:description, :position)
  end
end
