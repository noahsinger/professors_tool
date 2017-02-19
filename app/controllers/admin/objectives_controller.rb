class Admin::ObjectivesController < ApplicationController
  before_action :authenticate
  before_action :load_course
  
  def load_course
    @course = Course.find( params[:course_id] )
  end
  
  # GET /objectives
  # GET /objectives.xml
  def index
    @objectives = @course.objectives.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @objectives }
    end
  end

  # GET /objectives/new
  # GET /objectives/new.xml
  def new
    @objective = @course.objectives.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @objective }
    end
  end

  # GET /objectives/1/edit
  def edit
    @objective = @course.objectives.find(params[:id])
  end

  # POST /objectives
  # POST /objectives.xml
  def create
    @objective = @course.objectives.build(allowed_params)

    respond_to do |format|
      if @objective.save
        @status = admin_course_objectives_url(@course)
        flash[:notice] = 'Objective was successfully created.'
        format.html { redirect_to(admin_course_objectives_url(@course)) }
        format.xml  { render xml: @objective, status: :created, location: @objective }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @objective.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /objectives/1
  # PUT /objectives/1.xml
  def update
    @objective = @course.objectives.find(params[:id])

    respond_to do |format|
      if @objective.update_attributes(allowed_params)
        @status = admin_course_objectives_url(@course)
        flash[:notice] = 'Objective was successfully updated.'
        format.html { redirect_to(admin_course_objectives_url(@course)) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @objective.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end
  
  def sort
    @course.objectives.all.each do |objective|
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
    @objective = Objective.find(params[:id])
    @objective.destroy

    respond_to do |format|
      @status = admin_course_objectives_url(@course)
      format.html { redirect_to(admin_course_objectives_url(@course)) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:objective).permit(:description, :position)
  end
end
