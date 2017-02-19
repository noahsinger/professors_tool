class GradeRequestsController < ApplicationController
  before_action :load_semester
  before_action :load_section

  def load_semester
    @semester = Semester.find( params[:semester_id] )
  end

  def load_section
    @section = @semester.sections.find( params[:section_id] )
  end

  # GET /grade_requests/new
  # GET /grade_requests/new.xml
  def new
    @grade_request = @section.grade_requests.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @grade_request }
    end
  end

  # POST /grade_requests
  # POST /grade_requests.xml
  def create
  	# get previous requests made by someone with this email address
    prev_request = @section.grade_requests.where('email = ?', allowed_params[:email].downcase).first

    # create the grade request
    @grade_request= @section.grade_requests.build( allowed_params )

    # find the enrollment id for the student making the request
    @section.enrollments.each do |enrollment|
      if enrollment.student.email == allowed_params[:email].downcase
        @grade_request.enrollment_id = enrollment.id
      end
    end

    respond_to do |format|
      unless @grade_request.enrollment
      	# if no one in this section has the requesters email address it must be a request from a non-enrolled student
        @status = "failed"
        @grade_request.status = 'denied'
        @grade_request.errors.add :email, 'does not match any enrollments for this section.  Are you sure you are using your school email address and not a personal email address?';
        format.html { render action: "new" }
      else
        if @grade_request.save
          target = Time.now.ago( 600 ) # 10 minutes ago

          # if they have made a request in the last 10 minutes
          if prev_request and prev_request.created_at > target
            #dont send email, display error
            @status = "failed"
            @grade_request.update_attributes status: 'denied'
            @grade_request = @section.grade_requests.build
            @grade_request.errors.add :email, 'was used to request grades a very short time ago. Please wait awhile before trying again.'
            format.html { render action: "new" }
            format.js
          else
            @grade_request.send_email

            @status = semester_section_assignments_url(@semester,@section)
            @grade_request.update_attributes status: 'sent'
            flash[:notice] = "A grade email has been sent to your email address"
            format.html { redirect_to( semester_section_assignments_url(@semester,@section) ) }
          end
        else
        	# if the grade request is incomplete in some way (missing email?)
          @status = "failed"
          format.html { render action: "new" }
        end
      end #end unless enrollment
      
      format.js
    end # respond_to
  end #end method

  def allowed_params
    # params.require(:grade_request).permit(:email, :section_id, :semester_id, :student_id, :status)
    params.require(:grade_request).permit(:email)
  end
end
