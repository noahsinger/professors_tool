class Admin::StudentsController < ApplicationController
  before_filter :authenticate
  
  before_filter :load_semester, :only => [:new, :create, :unenroll]
  before_filter :load_section, :only => [:new, :create, :unenroll]
    
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
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  def show
   xxx@xxx.xxx = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
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
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  def edit
   xxx@xxx.xxx = Student.find(params[:id])
  end

  def create
   xxx@xxx.xxx = Student.new(params[:student])
    
    respond_to do |format|
      xxx@xxx.xxx
       xxx@xxx.xxx = Enrollment.new
        @enrollment.student_id xxx@xxx.xxx
        @enrollment.section_id xxx@xxx.xxx
        
       xxx@xxx.xxx = EnrollmentStatus.where("name = 'Enrolled'").first
        @enrollment.enrollment_status xxx@xxx.xxx
        
       xxx@xxx.xxx
        
        flash[:notice] = 'Student was successfully created and enrolled.'
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @student, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end #if save
    end #respond_to
  end

  def update
   xxx@xxx.xxx = Student.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Student was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  def destroy
   xxx@xxx.xxx = Student.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { redirect_to(admin_students_url) }
      format.xml  { head :ok }
    end
  end
  
end
