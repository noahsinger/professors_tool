class Admin::RequirementsController < ApplicationController
  before_action :authenticate

  before_action :load_lab
  before_action :load_course
  
  def load_lab
   xxx@xxx.xxx = Lab.find( params[:lab_id] )
  end
  
  def load_course
   xxx@xxx.xxx = Course.find( params[:course_id] )
  end
  
  # GET /requirements/new
  # GET /requirements/new.xml
  def new
    @requirement xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /requirements/1/edit
  def edit
    @requirement xxx@xxx.xxx
  end

  # POST /requirements
  # POST /requirements.xml
  def create
    @requirement xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Requirement was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render xml: @requirement, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /requirements/1
  # PUT /requirements/1.xml
  def update
    @requirement xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Requirement was successfully updated.'
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
  
  def sort
   xxx@xxx.xxx do |requirement|
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
    @requirement xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      @status = xxx@xxx.xxx
      format.html { xxx@xxx.xxx @lab )) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:requirement).permit(:description, :points, :position)
  end
end
