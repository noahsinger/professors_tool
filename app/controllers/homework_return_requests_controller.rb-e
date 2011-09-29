class HomeworkReturnRequestsController < ApplicationController
  before_filter :load_semester
  before_filter :load_section
  before_filter :load_assignment
  
  def load_semester
   xxx@xxx.xxx = Semester.find( params[:semester_id] )
  end
  
  def load_section
    @section xxx@xxx.xxx params[:section_id] )
  end
  
  def load_assignment
    @assignment xxx@xxx.xxx params[:assignment_id] )
  end
  
  # GET /homework_return_requests/new
  # GET /homework_return_requests/new.xml
  def new
    @homework_return_request xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # POST /homework_return_requests
  # POST /homework_return_requests.xml
  def create
    prev_request xxx@xxx.xxx = ?', params[:homework_return_request][:email]).first
    @homework_return_request xxx@xxx.xxx

    @work xxx@xxx.xxx
    
    respond_to do |format|
      if @work xxx@xxx.xxx
        @homework_return_request.enrollment_id xxx@xxx.xxx
      end

      target = Time.now.ago( 600 ) # 10 minutes ago
      
      xxx@xxx.xxx
        xxx@xxx.xxx == "removed"
         xxx@xxx.xxx :status => 'denied'
          @homework_return_request xxx@xxx.xxx
          flash[:notice] = "That assignment's attachment is not longer stored on this site as it's more than 1 year old."
          format.html { xxx@xxx.xxx }
        elsif prev_request and prev_request.created_at > target
          #dont send email, display error
         xxx@xxx.xxx :status => 'denied'
          @homework_return_request xxx@xxx.xxx
         xxx@xxx.xxx :email, 'was used to make a homework return request just a short while ago.  Do you think that something has happened to your assignment in that short amount of time?  Please wait a while before making this request again.'
          format.html { render :action => "new" }
        else
          xxx@xxx.xxx params[:homework_return_request][:email] )
          
         xxx@xxx.xxx :status => 'sent'

          flash[:notice] = "An email has been sent to your address with your assignment attached"
          format.html { xxx@xxx.xxx }  
        end
      else
        format.html { render :action => "new" }
      end
    end
  end
end
