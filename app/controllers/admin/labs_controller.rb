class Admin::LabsController < ApplicationController
  before_action :authenticate
  before_action :load_course
  
  def load_course
   xxx@xxx.xxx = Course.find(params[:course_id])
  end
  
  # GET /labs
  # GET /labs.xml
  def index
    @labs xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /labs/1
  # GET /labs/1.xml
  def show
    @lab xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /labs/new
  # GET /labs/new.xml
  def new
    @lab xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /labs/1/edit
  def edit
    @lab xxx@xxx.xxx
  end

  # POST /labs
  # POST /labs.xml
  def create
    @lab xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Lab was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render xml: @lab, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /labs/1
  # PUT /labs/1.xml
  def update
    @lab xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        # if the lab's course has changed (it's been moved) then it needs to 
        #  be reloaded to report the correct course for redirection below
       xxx@xxx.xxx 
        
        @status = xxx@xxx.xxx
        flash[:notice] = 'Lab was successfully updated.'
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
  
  def duplicate
    @orig_lab xxx@xxx.xxx
    
    @lab xxx@xxx.xxx
    @orig_lab.requirements.each xxx@xxx.xxx req.dup}
    @orig_lab.extras.each xxx@xxx.xxx ex.dup}
    
   xxx@xxx.xxx
    
    respond_to do |format|
      flash[:notice] = 'Duplication is complete'
      @status = xxx@xxx.xxx @lab)
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
      format.js
    end
  end

  # DELETE /labs/1
  # DELETE /labs/1.xml
  def destroy
    @lab xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      @status = xxx@xxx.xxx
      format.html { xxx@xxx.xxx )) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:lab).permit(:title, :objective, :instructions, :visible, :allow_uploads, :course_id)
  end
end
