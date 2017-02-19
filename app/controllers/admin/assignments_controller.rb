class Admin::AssignmentsController < ApplicationController
  before_action :authenticate
  before_action :load_semester
  before_action :load_section

  def load_semester
    @semester = Semester.find( params[:semester_id] )
  end

  def load_section
    @section = Section.find( params[:section_id] )
  end

  # GET /assignments
  # GET /assignments.xml
  def index
    @assignments = @section.assignments.order('duedate desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.xml
  def show
    @assignment = @section.assignments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.xml
  def new
    @assignment = @section.assignments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @assignment }
    end
  end

  # GET /assignments/1/edit
  def edit
    @assignment = @section.assignments.find(params[:id])
  end

  # POST /assignments
  # POST /assignments.xml
  def create
    @assignment = @section.assignments.build(allowed_params)

    respond_to do |format|
      if @assignment.save
        flash[:notice] = 'Assignment was successfully created.'
        @status = new_admin_assignment_tweet_url(assignment_id: @assignment, status: 'new')
        format.html { redirect_to(new_admin_assignment_tweet_url(assignment_id: @assignment, status: 'new')) }
        format.xml  { render xml: @assignment, status: :created, location: @assignment }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @assignment.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.xml
  def update
    @assignment = @section.assignments.find(params[:id])
    old_duedate = @assignment.duedate

    respond_to do |format|
      if @assignment.update_attributes(allowed_params)
        flash[:notice] = 'Assignment was successfully updated.'

        destination = admin_semester_section_assignment_url(@semester,@section,@assignment)
        unless @assignment.duedate == old_duedate
          destination = new_admin_assignment_tweet_url(assignment_id: @assignment, status: "duedate")
        end

        @status = destination
        format.html { redirect_to(destination) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @assignment.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.xml
  def destroy
    @assignment = @section.assignments.find(params[:id])
    @assignment.destroy

    respond_to do |format|
      @status = admin_semester_section_assignments_url(@semester, @section)
      format.html { redirect_to(admin_semester_section_assignments_url(@semester, @section)) }
      format.xml  { head :ok }
      format.js
    end
  end

  def allowed_params
    params.require(:assignment).permit(:title, :lab, :duedate, :lab_id)
  end

end
