class Admin::StepsController < ApplicationController
  before_action :authenticate
  
  before_action :load_howto
  before_action :load_course
  
  def load_howto
   xxx@xxx.xxx = HowTo.find( params[:how_to_id] )
  end
  
  def load_course
   xxx@xxx.xxx = Course.find(params[:course_id])
  end

  def index
    @steps xxx@xxx.xxx
  end

  # GET /steps/1
  # GET /steps/1.xml
  def show
    @step xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /steps/new
  # GET /steps/new.xml
  def new
    @step xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /steps/1/edit
  def edit
    @step xxx@xxx.xxx
  end

  # POST /steps
  # POST /steps.xml
  def create
    @step xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @status = admin_how_to_step_path(@how_to,@step, xxx@xxx.xxx
        flash[:notice] = 'Step was successfully created.'
        format.html { redirect_to(admin_how_to_step_path(@how_to,@step, xxx@xxx.xxx }
        format.xml  { render xml: @step, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /steps/1
  # PUT /steps/1.xml
  def update
    @step xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @status = admin_how_to_step_path(@how_to,@step, xxx@xxx.xxx
        flash[:notice] = 'Step was successfully updated.'
        format.html { redirect_to(admin_how_to_step_path(@how_to,@step, xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render action: "edit" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.xml
  def destroy
    @step xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      @status = admin_how_to_steps_path(@how_to, xxx@xxx.xxx
      format.html { redirect_to(admin_how_to_steps_url(@how_to, xxx@xxx.xxx }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def sort
   xxx@xxx.xxx do |step|
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
