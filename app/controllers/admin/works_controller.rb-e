class Admin::WorksController < ApplicationController
	before_action :bypass_authentication, only: [:download]
  before_action :authenticate

  before_action :load_semester
  before_action :load_section
  before_action :load_assignment
  
  def bypass_authentication
  	work = Work.find( params[:id] )
	  if work and work.withdrawal_code == params[:code]    
			session[:authentication_bypass] = true
	    logger.info("authentication skipped, proper code submitted")
	  else
	  	logger.info("invalid code, authentication not skipped")
	  end
  end
  
  def load_semester
    if params[:semester_id]
     xxx@xxx.xxx = Semester.find( params[:semester_id] )
    else
     xxx@xxx.xxx = Work.find(params[:id]).assignment.section.semester
    end
  end
  
  def load_section
    if params[:section_id]
     xxx@xxx.xxx = Section.find( params[:section_id] )
    else
     xxx@xxx.xxx = Work.find(params[:id]).assignment.section
    end
  end

  def load_assignment
    if params[:assignment_id]
     xxx@xxx.xxx = Assignment.find( params[:assignment_id] )
    else
     xxx@xxx.xxx = Work.find(params[:id]).assignment
    end
  end  
  
  def download
    work = Work.find( params[:id] )
        
    send_file( work.upload.path, 
                type: work.upload_content_type, 
								disposition: 'attachment',
                filename: work.upload_file_name )
  end
  
  # GET /works
  # GET /works.xml
  def index
    @works xxx@xxx.xxx
    
   xxx@xxx.xxx = Array.new

   xxx@xxx.xxx do |enrollment|
      if not xxx@xxx.xxx )
       xxx@xxx.xxx << enrollment
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /works/1
  # GET /works/1.xml
  def show
    @work xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /works/new
  # GET /works/new.xml
  def new
    @work xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end
  
  def new_for_all
   xxx@xxx.xxx do |e|
      if e.enrollment_status.id != EnrollmentStatus.dropped.id
        unless e.works.where('assignment_id = xxx@xxx.xxx
          @work xxx@xxx.xxx
         xxx@xxx.xxx = e.student.email
         xxx@xxx.xxx = e
         xxx@xxx.xxx
        end
      end
    end
    
    respond_to do |format|
      xxx@xxx.xxx
        flash[:error] = "Can not mass create assignments that require uploads"
      end
      
      @status = xxx@xxx.xxx
      format.html { xxx@xxx.xxx }
      format.js
    end
  end

  # GET /works/1/edit
  def edit
    @work xxx@xxx.xxx
  end

  # POST /works
  # POST /works.xml
  def create
    @work xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @work.email xxx@xxx.xxx
      end

      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Work was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render xml: @work, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /works/1
  # PUT /works/1.xml
  def update
    @work xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Work was successfully updated.'
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

  # DELETE /works/1
  # DELETE /works/1.xml
  def destroy
    @work xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      @status = xxx@xxx.xxx @section, @assignment)
      format.html { xxx@xxx.xxx @section, @assignment )) }
      format.xml  { head :ok }
      format.js
    end
  end

  def destroy_grade
    @work xxx@xxx.xxx
   xxx@xxx.xxx do |ap|
      ap.destroy
    end
    
   xxx@xxx.xxx = ""
   xxx@xxx.xxx
    
    flash[:notice] = "The grade has been destroyed."

    respond_to do |format|
      @status = xxx@xxx.xxx @section, @assignment)
      format.html { xxx@xxx.xxx @section, @assignment )) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def grade
    @work xxx@xxx.xxx
  end
  
  def record_score
    @work xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        #ap[0] is the requirements id 
        #ap[1] is the earned points submitted from the form

        # if no points have been previously awarded for this work
        if @work.awarded_points.size xxx@xxx.xxx
          #create a new set of awarded points for it
          params[:awarded_points].each do |point_id, amount|
            awarded_point = AwardedPoint.create
            xxx@xxx.xxx requirement: Requirement.find(point_id), points: amount)
          end
        else
          #change the awarded points that already go with this work
          params[:awarded_points].each do |point_id, amount|
            existing_point xxx@xxx.xxx point_id).first
            existing_point.update_attribute( :points, amount )
          end
        end
    
        @status = xxx@xxx.xxx @section, @assignment)
        format.html { xxx@xxx.xxx @section, @assignment )) }
        format.xml  { head :ok }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "edit" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end    
  end
  
  def allowed_params
    params.require(:work).permit(:upload, :email, :enrollment_id, :instructors_comments, :assignment_id, :awarded_points)
  end
end
