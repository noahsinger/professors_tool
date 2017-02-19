class Admin::RequirementsController < ApplicationController
  before_action :authenticate

  before_action :load_lab
  before_action :load_course
  
  def load_lab
    @lab = Lab.find( params[:lab_id] )
  end
  
  def load_course
    @course = Course.find( params[:course_id] )
  end
  
  # GET /requirements/new
  # GET /requirements/new.xml
  def new
    @requirement = @lab.requirements.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @requirement }
    end
  end

  # GET /requirements/1/edit
  def edit
    @requirement = @lab.requirements.find(params[:id])
  end

  # POST /requirements
  # POST /requirements.xml
  def create
    @requirement = @lab.requirements.build(allowed_params)

    respond_to do |format|
      if @requirement.save
        @status = admin_course_lab_url(@course,@lab)
        flash[:notice] = 'Requirement was successfully created.'
        format.html { redirect_to([:admin,@course,@lab]) }
        format.xml  { render xml: @requirement, status: :created, location: @requirement }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @requirement.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /requirements/1
  # PUT /requirements/1.xml
  def update
    @requirement = @lab.requirements.find(params[:id])

    respond_to do |format|
      if @requirement.update_attributes(allowed_params)
        @status = admin_course_lab_url(@course,@lab)
        flash[:notice] = 'Requirement was successfully updated.'
        format.html { redirect_to([:admin,@course,@lab]) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @requirement.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end
  
  def sort
    @lab.requirements.all.each do |requirement|
      if position = params[:requirements_table].index(requirement.id.to_s)
        requirement.update_attribute(:position, position + 1) unless requirement.position == position + 1
      end
    end
    
    respond_to do |format|
      format.html { render nothing: true, status: 200 }
      format.js
      format.xml  { head :ok }
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.xml
  def destroy
    @requirement = @lab.requirements.find(params[:id])
    @requirement.destroy

    respond_to do |format|
      @status = admin_course_lab_url(@course,@lab)
      format.html { redirect_to(admin_course_lab_url( @course, @lab )) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:requirement).permit(:description, :points, :position)
  end
end
