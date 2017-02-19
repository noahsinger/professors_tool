class Admin::LabsController < ApplicationController
  before_action :authenticate
  before_action :load_course
  
  def load_course
    @course = Course.find(params[:course_id])
  end
  
  # GET /labs
  # GET /labs.xml
  def index
    @labs = @course.labs.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @labs }
    end
  end

  # GET /labs/1
  # GET /labs/1.xml
  def show
    @lab = @course.labs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @lab }
    end
  end

  # GET /labs/new
  # GET /labs/new.xml
  def new
    @lab = @course.labs.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @lab }
    end
  end

  # GET /labs/1/edit
  def edit
    @lab = @course.labs.find(params[:id])
  end

  # POST /labs
  # POST /labs.xml
  def create
    @lab = @course.labs.build(allowed_params)

    respond_to do |format|
      if @lab.save
        @status = admin_course_lab_url(@course,@lab)
        flash[:notice] = 'Lab was successfully created.'
        format.html { redirect_to([:admin,@course,@lab]) }
        format.xml  { render xml: @lab, status: :created, location: @lab }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @lab.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /labs/1
  # PUT /labs/1.xml
  def update
    @lab = @course.labs.find(params[:id])

    respond_to do |format|
      if @lab.update_attributes(allowed_params)
        # if the lab's course has changed (it's been moved) then it needs to 
        #  be reloaded to report the correct course for redirection below
        @lab.reload 
        
        @status = admin_course_lab_url(@lab.course,@lab)
        flash[:notice] = 'Lab was successfully updated.'
        format.html { redirect_to([:admin,@lab.course,@lab]) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @lab.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end
  
  def duplicate
    @orig_lab = @course.labs.find(params[:id])
    
    @lab = @orig_lab.dup
    @orig_lab.requirements.each {|req| @lab.requirements.push req.dup}
    @orig_lab.extras.each {|ex| @lab.extras.push ex.dup}
    
    @lab.save
    
    respond_to do |format|
      flash[:notice] = 'Duplication is complete'
      @status = admin_course_lab_url(@course, @lab)
      format.html { redirect_to(admin_course_lab_url(@course,@lab)) }
      format.xml  { head :ok }
      format.js
    end
  end

  # DELETE /labs/1
  # DELETE /labs/1.xml
  def destroy
    @lab = @course.labs.find(params[:id])
    @lab.destroy

    respond_to do |format|
      @status = admin_course_labs_url(@course)
      format.html { redirect_to(admin_course_labs_url( @course )) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:lab).permit(:title, :objective, :instructions, :visible, :allow_uploads, :course_id)
  end
end
