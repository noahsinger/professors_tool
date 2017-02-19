class Admin::EnrollmentsController < ApplicationController
  before_action :authenticate
  
  before_action :load_semester
  before_action :load_section
  
  def load_semester
    @semester = Semester.find(params[:semester_id])
  end
  
  def load_section
    @section = Section.find(params[:section_id])
  end
  
  def index
    @enrollments = @section.enrollments.all
  end
  
  def new
    @enrollment = Enrollment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @enrollment }
    end
  end
  
  # GET /enrollments/1
  # GET /enrollments/1.xml
  def show
    @enrollment = @section.enrollments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @extra }
    end
  end
  
  def create
    @existing_student = Student.where("email = ?", params[:email]).first
    
    respond_to do |format|
      if @existing_student
        @enrollment = Enrollment.new
        @enrollment.student_id = @existing_student.id
        @enrollment.section_id = @section.id
        
        @enrollment.enrollment_status = EnrollmentStatus.enrolled
        
        @enrollment.save
        
        @status = admin_semester_section_enrollments_url(@semester, @section)
        format.html {redirect_to(admin_semester_section_enrollments_url(@semester, @section))}
      else
        @enrollment = Enrollment.new
        @status = new_admin_semester_section_student_url(@semester, @section)
        session[:email] = params[:email]
        format.html {redirect_to(new_admin_semester_section_student_url(@semester, @section))}
        format.xml  { render xml: @student.errors, status: :unprocessable_entity }
      end
      
      format.js
    end
  end
  
  def update
    @enrollment = Enrollment.find(params[:id])
    @student = @enrollment.student

    respond_to do |format|
      if @enrollment.update_attributes(allowed_params)
        @status = admin_semester_section_enrollment_url(@semester,@section,@enrollment)
        flash[:notice] = 'Enrollment was successfully updated with status.'
        format.html { redirect_to([:admin,@semester,@section,@enrollment]) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @student.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end
  
  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy

    respond_to do |format|
      @status = admin_semester_section_enrollments_url(@semester,@section)
      format.html { redirect_to(admin_semester_section_enrollments_url(@semester,@section)) }
      format.xml  { head :ok }
    end
  end

  def allowed_params
    params.require(:enrollment).permit(:student_id, :enrollment_status_id)
  end 
end
