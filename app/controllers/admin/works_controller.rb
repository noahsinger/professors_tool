class Admin::WorksController < ApplicationController
  before_filter :authenticate

  before_filter :load_semester
  before_filter :load_section
  before_filter :load_assignment
  
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
    
    # TODO: try changing this to x_send_file which will use the x_send_file plugin which has the potential to
    # send the file much more efficiently than send_file does.  Didn't work in development through mongrel
    # but might work when it's running through apache.
    send_file( work.upload.path, 
                :type => work.upload_content_type, 
                :disposition => 'inline', 
                :filename => work.upload_file_name )
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
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /works/1
  # GET /works/1.xml
  def show
    @work xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
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
  
  def new_for_all
   xxx@xxx.xxx do |e|
      unless e.works.find( :first, :conditions => ['assignment_id = xxx@xxx.xxx )
        @work xxx@xxx.xxx
       xxx@xxx.xxx = e.student.email
       xxx@xxx.xxx = e
       xxx@xxx.xxx
      end
    end
    
    respond_to do |format|
      format.html { xxx@xxx.xxx }
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
      @work.email xxx@xxx.xxx

      xxx@xxx.xxx
        flash[:notice] = 'Work was successfully created.'
        # format.html { xxx@xxx.xxx }
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @work, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /works/1
  # PUT /works/1.xml
  def update
    @work xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Work was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.xml
  def destroy
    @work xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      format.html { xxx@xxx.xxx @section, @assignment )) }
      format.xml  { head :ok }
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
      format.html { xxx@xxx.xxx @section, @assignment )) }
      format.xml  { head :ok }
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
          params[:awarded_points].each do |ap|
            awarded_point = AwardedPoint.new
            awarded_point.work xxx@xxx.xxx
            awarded_point.requirement = Requirement.find( ap[0] )
            awarded_point.points = ap[1]
            awarded_point.save
          end
        else
          #change the awarded points that already go with this work
          params[:awarded_points].each do |ap|
            existing_point xxx@xxx.xxx :first, :conditions => ['requirement_id=?', ap[0]])
            existing_point.points = ap[1]
            existing_point.save
          end
        end
        
        flash[:notice] = 'The grade has been recorded.'
        format.html { xxx@xxx.xxx @section, @assignment )) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end    
  end
end
