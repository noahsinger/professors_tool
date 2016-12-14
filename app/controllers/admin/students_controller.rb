class Admin::StudentsController < ApplicationController
  before_action :authenticate

  before_action :load_semester, only: [:new, :create, :unenroll]
  before_action :load_section, only: [:new, :create, :unenroll]

  def load_semester
   xxx@xxx.xxx = Semester.find(params[:semester_id])
  end

  def load_section
   xxx@xxx.xxx = Section.find(params[:section_id])
  end

  def index
	  if params['q']
xxx@xxx.xxx = Student.search(params['q'])
	  else
  	 xxx@xxx.xxx = Student.paginate(params['page'] || 0).order('last_name')
  	end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  def show
   xxx@xxx.xxx = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  def new
   xxx@xxx.xxx = Student.new

    if session[:email]
     xxx@xxx.xxx = session[:email]
      session[:email] = nil

      # extract the first and last name from the email address
      d = @student.email.match xxx@xxx.xxx
      if d
       xxx@xxx.xxx = d[1].capitalize
       xxx@xxx.xxx = d[2].capitalize
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  def edit
   xxx@xxx.xxx = Student.find(params[:id])
  end

  def create
   xxx@xxx.xxx = Student.new(allowed_params)

    respond_to do |format|
      xxx@xxx.xxx
       xxx@xxx.xxx = Enrollment.new
        @enrollment.student_id xxx@xxx.xxx
        @enrollment.section_id xxx@xxx.xxx

       xxx@xxx.xxx = EnrollmentStatus.enrolled

       xxx@xxx.xxx

        @status = xxx@xxx.xxx @section)
        flash[:notice] = 'Student was successfully created and enrolled.'
        format.html { xxx@xxx.xxx @section)) }
        format.xml  { render xml: @student, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end #if save
      format.js
    end #respond_to
  end

  def update
   xxx@xxx.xxx = Student.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Student was successfully updated.'
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

  def destroy
   xxx@xxx.xxx = Student.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
     xxx@xxx.xxx = admin_students_url
      format.html { redirect_to(admin_students_url) }
      format.xml  { head :ok }
      format.js
    end
  end

  def allowed_params
    params.require(:student).permit(:first_name, :last_name, :email, :middle_name, :goes_by)
  end
end
