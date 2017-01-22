class Admin::EnrollmentsController < ApplicationController
  before_action :authenticate
  
  before_action :load_semester
  before_action :load_section
  
  def load_semester
   xxx@xxx.xxx = Semester.find(params[:semester_id])
  end
  
  def load_section
   xxx@xxx.xxx = Section.find(params[:section_id])
  end
  
  def index
    @enrollments xxx@xxx.xxx
  end
  
  def new
   xxx@xxx.xxx = Enrollment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end
  
  # GET /enrollments/1
  # GET /enrollments/1.xml
  def show
    @enrollment xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end
  
  def create
   xxx@xxx.xxx = Student.where("email = ?", params[:email]).first
    
    respond_to do |format|
      xxx@xxx.xxx
       xxx@xxx.xxx = Enrollment.new
        @enrollment.student_id xxx@xxx.xxx
        @enrollment.section_id xxx@xxx.xxx
        
       xxx@xxx.xxx = EnrollmentStatus.enrolled
        
       xxx@xxx.xxx
        
        @status = xxx@xxx.xxx @section)
        format.html xxx@xxx.xxx @section))}
      else
       xxx@xxx.xxx = Enrollment.new
        @status = xxx@xxx.xxx @section)
        session[:email] = params[:email]
        format.html xxx@xxx.xxx @section))}
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      
      format.js
    end
  end
  
  def update
   xxx@xxx.xxx = Enrollment.find(params[:id])
    @student xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Enrollment was successfully updated with status.'
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
   xxx@xxx.xxx = Enrollment.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      @status = xxx@xxx.xxx
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
    end
  end

  def allowed_params
    params.require(:enrollment).permit(:student_id, :enrollment_status_id)
  end 
end
