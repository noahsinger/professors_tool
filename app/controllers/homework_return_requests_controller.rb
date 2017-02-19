class HomeworkReturnRequestsController < ApplicationController
  before_action :load_semester
  before_action :load_section
  before_action :load_assignment
  
  def load_semester
    @semester = Semester.find( params[:semester_id] )
  end
  
  def load_section
    @section = @semester.sections.find( params[:section_id] )
  end
  
  def load_assignment
    @assignment = @section.assignments.find( params[:assignment_id] )
  end
  
  # GET /homework_return_requests/new
  # GET /homework_return_requests/new.xml
  def new
    @homework_return_request = @assignment.homework_return_requests.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @homework_return_request }
    end
  end

  # POST /homework_return_requests
  # POST /homework_return_requests.xml
  def create
    prev_request = @assignment.homework_return_requests.where('email = ?', params[:homework_return_request][:email]).first
    @homework_return_request = @assignment.homework_return_requests.build(allowed_params)

    @work = @assignment.works.find_by_email(params[:homework_return_request][:email])
    
    respond_to do |format|
      if @work and @work.enrollment
        @homework_return_request.enrollment_id = @work.enrollment.id
      end

      target = Time.now.ago( 600 ) # 10 minutes ago
      
      if @homework_return_request.save
        if @work.upload_content_type == "removed"
          @homework_return_request.update_attributes status: 'denied'
          @homework_return_request = @assignment.homework_return_requests.build
          flash[:notice] = "That assignment's attachment is no longer stored on this site as it's more than 1 year old."
          @status = semester_section_assignment_url(@semester,@section,@assignment)
          format.html { redirect_to([@semester,@section,@assignment]) }
        elsif prev_request and prev_request.created_at > target
          #dont send email, display error
          @homework_return_request.update_attributes status: 'denied'
          @homework_return_request = @assignment.homework_return_requests.build
          @homework_return_request.errors.add :email, 'was used to make a homework return request just a short while ago. Please wait a while before making this request again.'
          @status = "failed"
          format.html { render action: "new" }
        else
          @homework_return_request.send_email(@work, params[:homework_return_request][:email])
          
          @homework_return_request.update_attributes status: 'sent'

          flash[:notice] = "An email has been sent to your address with your assignment attached"
          @status = semester_section_assignment_url(@semester,@section,@assignment)
          format.html { redirect_to([@semester,@section,@assignment]) }  
        end
      else
        @status = "failed"
        format.html { render action: "new" }
      end
      format.js
    end
  end
  
  def allowed_params
    params.require(:homework_return_request).permit(:email, :assignment, :enrollment, :status)
  end
end
