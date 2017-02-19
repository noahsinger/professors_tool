class Admin::StudentsController < ApplicationController
  before_action :authenticate

  before_action :load_semester, only: [:new, :create, :unenroll]
  before_action :load_section, only: [:new, :create, :unenroll]

  def load_semester
    @semester = Semester.find(params[:semester_id])
  end

  def load_section
    @section = Section.find(params[:section_id])
  end

  def index
	  @students = Student.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @students }
    end
  end
  
  def search
	  @students = Student.search(params[:q]).paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.xml  { render xml: @students }
      format.js
    end
  end

  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @student }
    end
  end

  def new
    @student = Student.new

    if session[:email]
      @student.email = session[:email]
      session[:email] = nil

      # extract the first and last name from the email address
      d = @student.email.match /^(\w+)\.([a-zA-Z]+)\d*@/
      if d
        @student.first_name = d[1].capitalize
        @student.last_name = d[2].capitalize
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @student }
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(allowed_params)

    respond_to do |format|
      if @student.save
        @enrollment = Enrollment.new
        @enrollment.student_id = @student.id
        @enrollment.section_id = @section.id

        @enrollment.enrollment_status = EnrollmentStatus.enrolled

        @enrollment.save

        @status = admin_semester_section_enrollments_url(@semester, @section)
        flash[:notice] = 'Student was successfully created and enrolled.'
        format.html { redirect_to(admin_semester_section_enrollments_url(@semester, @section)) }
        format.xml  { render xml: @student, status: :created, location: @student }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @student.errors, status: :unprocessable_entity }
      end #if save
      format.js
    end #respond_to
  end

  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(allowed_params)
        @status = admin_student_url(@student)
        flash[:notice] = 'Student was successfully updated.'
        format.html { redirect_to([:admin,@student]) }
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
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      @status = admin_students_url
      format.html { redirect_to(admin_students_url) }
      format.xml  { head :ok }
      format.js
    end
  end

  def allowed_params
    params.require(:student).permit(:first_name, :last_name, :email, :middle_name, :goes_by)
  end
end
