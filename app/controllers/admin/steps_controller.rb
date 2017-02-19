class Admin::StepsController < ApplicationController
  before_action :authenticate
  
  before_action :load_howto
  before_action :load_course
  
  def load_howto
    @how_to = HowTo.find( params[:how_to_id] )
  end
  
  def load_course
    @course = Course.find(params[:course_id])
  end

  def index
    @steps = @how_to.steps.all
  end

  # GET /steps/1
  # GET /steps/1.xml
  def show
    @step = @how_to.steps.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @step }
    end
  end

  # GET /steps/new
  # GET /steps/new.xml
  def new
    @step = @how_to.steps.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @step }
    end
  end

  # GET /steps/1/edit
  def edit
    @step = @how_to.steps.find(params[:id])
  end

  # POST /steps
  # POST /steps.xml
  def create
    @step = @how_to.steps.build(allowed_params)

    respond_to do |format|
      if @step.save
        @status = admin_how_to_step_path(@how_to,@step, course_id: @course)
        flash[:notice] = 'Step was successfully created.'
        format.html { redirect_to(admin_how_to_step_path(@how_to,@step, course_id: @course)) }
        format.xml  { render xml: @step, status: :created, location: @step }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @step.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /steps/1
  # PUT /steps/1.xml
  def update
    @step = @how_to.steps.find(params[:id])

    respond_to do |format|
      if @step.update_attributes(allowed_params)
        @status = admin_how_to_step_path(@how_to,@step, course_id: @course)
        flash[:notice] = 'Step was successfully updated.'
        format.html { redirect_to(admin_how_to_step_path(@how_to,@step, course_id: @course)) }
        format.xml  { head :ok }
      else
        format.html { render action: "edit" }
        format.xml  { render xml: @step.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.xml
  def destroy
    @step = @how_to.steps.find(params[:id])
    @step.destroy

    respond_to do |format|
      @status = admin_how_to_steps_path(@how_to, course_id: @course)
      format.html { redirect_to(admin_how_to_steps_url(@how_to, course_id: @course)) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def sort
    @how_to.steps.all.each do |step|
      if position = params[:steps].index(step.id.to_s)
        step.update_attribute(:position, position + 1) unless step.position == position + 1
      end
    end
    
    respond_to do |format|
      format.html { head :ok }
      format.js
      format.xml  { head :ok }
    end
  end
  
  def allowed_params
    params.require(:step).permit(:image, :title, :instructions, :how_to)
  end
end
