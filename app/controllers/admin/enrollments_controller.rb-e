class Admin::EnrollmentsController < ApplicationController
  before_filter :authenticate
  
  before_filter :load_semester
  before_filter :load_section
  
  def load_semester
   xxx@xxx.xxx = Semester.find(params[:semester_id])
  end
  
  def load_section
   xxx@xxx.xxx = Section.find(params[:section_id])
  end
  
  def new
   xxx@xxx.xxx = Enrollment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end
  
  # GET /enrollments/1
  # GET /enrollments/1.xml
  def show
    @enrollment xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end
  
  def create
   xxx@xxx.xxx = Student.find( :first, :conditions => ["email = ?", params[:email]] )
    
    respond_to do |format|
      xxx@xxx.xxx
       xxx@xxx.xxx = Enrollment.new
        @enrollment.student_id xxx@xxx.xxx
        @enrollment.section_id xxx@xxx.xxx
        
       xxx@xxx.xxx = EnrollmentStatus.find( :first, :conditions => "name = 'Enrolled'" )
        @enrollment.enrollment_status xxx@xxx.xxx
        
       xxx@xxx.xxx
        
        format.html xxx@xxx.xxx @section ))}
      else
        session[:email] = params[:email]
        format.html xxx@xxx.xxx @section ))}
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end
  
  def update
   xxx@xxx.xxx = Enrollment.find(params[:id])
    @student xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Enrollment was successfully updated with status.'
        # format.html { xxx@xxx.xxx }
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
   xxx@xxx.xxx = Enrollment.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
    end
  end
  
end
