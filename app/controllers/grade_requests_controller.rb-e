class GradeRequestsController < ApplicationController
  include ExceptionNotifiable
  
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
    prev_request xxx@xxx.xxx :first, :conditions => ['email = ?', params[:grade_request][:email]])
    
   xxx@xxx.xxx @section.grade_requests.build( params[:grade_request] )
    
   xxx@xxx.xxx do |enrollment|
      if enrollment.student.email == params[:grade_request][:email]
       xxx@xxx.xxx = enrollment.id
      end
    end

    respond_to do |format|
      xxx@xxx.xxx
        xxx@xxx.xxx
          
          target = Time.now.ago( 600 ) # 10 minutes ago
          
          if prev_request and prev_request.created_at > target
            #dont send email, display error
           xxx@xxx.xxx :status => 'denied'
            @grade_request xxx@xxx.xxx
           xxx@xxx.xxx :email, 'was used to request grades a very short time ago.  What?, do you think I\'m just sitting here changing grades all the time? Please wait awhile before trying again.'
            format.html { render :action => "new" }
            format.iphone { render :action => "new" }
          else
            email = xxx@xxx.xxx )
            # Mailer.deliver( email )
            Mailer.send_later :deliver, email

           xxx@xxx.xxx :status => 'sent'
            flash[:notice] = "A grade email has been sent to your email address"
            format.html { redirect_to( xxx@xxx.xxx ) }
            format.iphone { redirect_to( xxx@xxx.xxx ) }
          end
        else
         xxx@xxx.xxx :status => 'denied'
         xxx@xxx.xxx :email, 'does not match any enrollments for this section.  Are you sure you are using your official email address for school and not a personal email address?';
          format.html { render :action => "new" }
          format.iphone { render :action => "new" }
        end
      else
        format.html { render :action => "new" }
        format.iphone { render :action => "new" }
      end
    end
  end
end
