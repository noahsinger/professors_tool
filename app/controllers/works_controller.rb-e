class WorksController < ApplicationController
  before_filter :load_semester
  before_filter :load_section
  before_filter :load_assignment
  
  def load_semester
   xxx@xxx.xxx = Semester.find( params[:semester_id] )
  end
  
  def load_section
   xxx@xxx.xxx = Section.find( params[:section_id] )
  end

  def load_assignment
   xxx@xxx.xxx = Assignment.find( params[:assignment_id] )
  end  
  
  # GET /works/new
  # GET /works/new.xml
  def new
    @work xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # POST /works
  # POST /works.xml
  def create
    @work xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      # make this work one with the assignment
      @work.assignment_id xxx@xxx.xxx
      
      # try to find the student who this assignment belongs to (based on the submitting email address)
      student = Student.where('email=?', params[:work][:email].downcase).first
      
      if student
        # if a student is found with a matching email address attribute the assignment to them
        @work.enrollment = xxx@xxx.xxx
      end
      
      # check if a work has already been submitted from this submission address
      prev_works xxx@xxx.xxx params[:work][:email].downcase)

      # if the work wasn't previously submitted
      if prev_works.size == 0
        # save the work
        xxx@xxx.xxx
          flash[:notice] = 'Your work was successfully uploaded.'
        
          # send the student an email including the withdrawal link
         xxx@xxx.xxx params[:work][:email].downcase
        
          format.html { xxx@xxx.xxx } 
          format.xml  { render :xml => @work, :status => :created, :location xxx@xxx.xxx }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
        end
      else
         xxx@xxx.xxx :email, 'has already submitted this work. If you want to resubmit, you must first withdraw your previous submission (check your email)'
        
          # send the submitter a reminder including the withdrawal link
          prev_works[0].send_reminder_email # params[:work][:email]
        
          format.html { render :action => "new" }
          format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end
  
  def withdraw
   xxx@xxx.xxx = ""
    
    if params[:code]
      @works xxx@xxx.xxx
      
      xxx@xxx.xxx > 0
       xxx@xxx.xxx do |work|
          if work.withdrawal_code == params[:code]
            if work.assignment.duedate < Time.now
             xxx@xxx.xxx = "pastdue"
            else
              work.destroy
             xxx@xxx.xxx = "destroyed"
            end
          end
        end
      else
       xxx@xxx.xxx = "no works"  
      end
    else
     xxx@xxx.xxx = "no code"
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.iphone
    end
  end
end
