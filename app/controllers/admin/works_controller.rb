class Admin::WorksController < ApplicationController
	before_action :bypass_authentication, only: [:download]
  before_action :authenticate

  before_action :load_semester
  before_action :load_section
  before_action :load_assignment
  
  def bypass_authentication
  	work = Work.find( params[:id] )
	  if work and work.withdrawal_code == params[:code]    
			session[:authentication_bypass] = true
	    logger.info("authentication skipped, proper code submitted")
	  else
	  	logger.info("invalid code, authentication not skipped")
	  end
  end
  
  def load_semester
    if params[:semester_id]
      @semester = Semester.find( params[:semester_id] )
    else
      @semester = Work.find(params[:id]).assignment.section.semester
    end
  end
  
  def load_section
    if params[:section_id]
      @section = Section.find( params[:section_id] )
    else
      @section = Work.find(params[:id]).assignment.section
    end
  end

  def load_assignment
    if params[:assignment_id]
      @assignment = Assignment.find( params[:assignment_id] )
    else
      @assignment = Work.find(params[:id]).assignment
    end
  end  
  
  def download
    work = Work.find( params[:id] )
        
    send_file( work.upload.path, 
                type: work.upload_content_type, 
								disposition: 'attachment',
                filename: work.upload_file_name )
  end
  
  # GET /works
  # GET /works.xml
  def index
    @works = @assignment.works.order(:created_at)
    
    @enrollments_without_works = Array.new

    @section.enrollments.each do |enrollment|
      if not enrollment.works.find_by_assignment_id( @assignment )
        @enrollments_without_works << enrollment
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @works }
    end
  end

  # GET /works/1
  # GET /works/1.xml
  def show
    @work = @assignment.works.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @work }
    end
  end

  # GET /works/new
  # GET /works/new.xml
  def new
    @work = @assignment.works.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @work }
    end
  end
  
  def new_for_all
    @section.enrollments.each do |e|
      if e.enrollment_status.id != EnrollmentStatus.dropped.id
        unless e.works.where('assignment_id = ?', @assignment.id).first
          @work = @assignment.works.build
          @work.email = e.student.email
          @work.enrollment = e
          @work.save
        end
      end
    end
    
    respond_to do |format|
      if @assignment.lab.allow_uploads
        flash[:error] = "Can not mass create assignments that require uploads"
      end
      
      @status = admin_semester_section_assignment_works_url(@semester,@section,@assignment)
      format.html { redirect_to(admin_semester_section_assignment_works_url(@semester,@section,@assignment)) }
      format.js
    end
  end

  # GET /works/1/edit
  def edit
    @work = @assignment.works.find(params[:id])
  end

  # POST /works
  # POST /works.xml
  def create
    @work = @assignment.works.build(allowed_params)

    respond_to do |format|
      if @work.enrollment
        @work.email = @work.enrollment.student.email
      end

      if @work.save
        @status = admin_semester_section_assignment_works_url(@semester,@section,@assignment)
        flash[:notice] = 'Work was successfully created.'
        format.html { redirect_to(admin_semester_section_assignment_works_url(@semester,@section,@assignment)) }
        format.xml  { render xml: @work, status: :created, location: @work }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @work.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /works/1
  # PUT /works/1.xml
  def update
    @work = @assignment.works.find(params[:id])

    respond_to do |format|
      if @work.update_attributes(allowed_params)
        @status = admin_semester_section_assignment_work_url(@semester,@section,@assignment,@work)
        flash[:notice] = 'Work was successfully updated.'
        format.html { redirect_to([:admin,@semester,@section,@assignment,@work]) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @work.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /works/1
  # DELETE /works/1.xml
  def destroy
    @work = @assignment.works.find(params[:id])
    @work.destroy

    respond_to do |format|
      @status = admin_semester_section_assignment_works_url(@semester, @section, @assignment)
      format.html { redirect_to(admin_semester_section_assignment_works_url( @semester, @section, @assignment )) }
      format.xml  { head :ok }
      format.js
    end
  end

  def destroy_grade
    @work = @assignment.works.find(params[:id])
    @work.awarded_points.each do |ap|
      ap.destroy
    end
    
    @work.instructors_comments = ""
    @work.save
    
    flash[:notice] = "The grade has been destroyed."

    respond_to do |format|
      @status = admin_semester_section_assignment_works_url(@semester, @section, @assignment)
      format.html { redirect_to(admin_semester_section_assignment_works_url( @semester, @section, @assignment )) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def grade
    @work = @assignment.works.find(params[:id])
  end
  
  def record_score
    @work = @assignment.works.find(params[:id])

    respond_to do |format|
      if @work.update_attributes(allowed_params)
        #ap[0] is the requirements id 
        #ap[1] is the earned points submitted from the form

        # if no points have been previously awarded for this work
        if @work.awarded_points.size < @work.assignment.lab.requirements.size
          #create a new set of awarded points for it
          params[:awarded_points].each do |point_id, amount|
            awarded_point = AwardedPoint.create
            awarded_point.update_attributes(work: @work, requirement: Requirement.find(point_id), points: amount)
          end
        else
          #change the awarded points that already go with this work
          params[:awarded_points].each do |point_id, amount|
            existing_point = @work.awarded_points.where('requirement_id=?', point_id).first
            existing_point.update_attribute( :points, amount )
          end
        end
    
        @status = admin_semester_section_assignment_works_url(@semester, @section, @assignment)
        format.html { redirect_to(admin_semester_section_assignment_works_url( @semester, @section, @assignment )) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @work.errors, status: :unprocessable_entity }
      end
      format.js
    end    
  end
  
  def allowed_params
    params.require(:work).permit(:upload, :email, :enrollment_id, :instructors_comments, :assignment_id, :awarded_points)
  end
end
