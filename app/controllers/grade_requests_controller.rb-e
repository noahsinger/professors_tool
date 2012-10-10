class GradeRequestsController < ApplicationController
  before_filter :load_semester
  before_filter :load_section
  
  def load_semester
   xxx@xxx.xxx = Semester.find( params[:semester_id] )
  end
  
  def load_section
    @section xxx@xxx.xxx params[:section_id] )
  end
  
  # GET /grade_requests/new
  # GET /grade_requests/new.xml
  def new
    @grade_request xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
      format.iphone
    end
  end

  # POST /grade_requests
  # POST /grade_requests.xml
  def create	  
  	# get previous requests made by someone with this email address
    prev_request xxx@xxx.xxx = ?', params[:grade_request][:email].downcase).first
    
    # create the grade request
   xxx@xxx.xxx @section.grade_requests.build( params[:grade_request] )
    
    # find the enrollment id for the student making the request
   xxx@xxx.xxx do |enrollment|
      if enrollment.student.email == params[:grade_request][:email].downcase
       xxx@xxx.xxx = enrollment.id
      end
    end

    respond_to do |format|
      xxx@xxx.xxx
      	# if the request was made by someone in this class
        xxx@xxx.xxx
          
          target = Time.now.ago( 600 ) # 10 minutes ago
          
          # if they have made a request in the last 10 minutes
          if prev_request and prev_request.created_at > target
            #dont send email, display error
           xxx@xxx.xxx :status => 'denied'
            @grade_request xxx@xxx.xxx
           xxx@xxx.xxx :email, 'was used to request grades a very short time ago. Please wait awhile before trying again.'
            format.html { render :action => "new" }
          else
            xxx@xxx.xxx )

           xxx@xxx.xxx :status => 'sent'
            flash[:notice] = "A grade email has been sent to your email address"
            format.html { redirect_to( xxx@xxx.xxx ) }
          end
        else
        	# if no one in this section has the requesters email address it must be a request from a non-enrolled student
         xxx@xxx.xxx :status => 'denied'
         xxx@xxx.xxx :email, 'does not match any enrollments for this section.  Are you sure you are using your official email address for school and not a personal email address?';
          format.html { render :action => "new" }
        end
      else
      	# if the grade request is incomplete in some way (missing email?)
        format.html { render :action => "new" }
      end
    end
  end
end
