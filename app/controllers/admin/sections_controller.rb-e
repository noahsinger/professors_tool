class Admin::SectionsController < ApplicationController
  before_action :authenticate    
  before_action :load_semester

  def load_semester
   xxx@xxx.xxx = Semester.find( params[:semester_id] )
  end

  # GET /sections
  # GET /sections.xml
  def index
    @sections xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /sections/1
  # GET /sections/1.xml
  def show
    @section xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /sections/new
  # GET /sections/new.xml
  def new
    @section xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /sections/1/edit
  def edit
    @section xxx@xxx.xxx
  end

  # POST /sections
  # POST /sections.xml
  def create
    @section xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        num_waiters xxx@xxx.xxx
       xxx@xxx.xxx
        flash[:notice] = "Section was successfully created and #{num_waiters} were notified."
        @status = xxx@xxx.xxx
        format.html { xxx@xxx.xxx }
        format.xml  { render xml: @section, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /sections/1
  # PUT /sections/1.xml
  def update
    @section xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Section was successfully updated.'
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

  # DELETE /sections/1
  # DELETE /sections/1.xml
  def destroy
    @section xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      @status = xxx@xxx.xxx
      flash[:notice] = "The section has been destroyed"
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def section_email
    @section xxx@xxx.xxx
    
    respond_to do |format|
      if params[:body] and params[:body] != ""
       xxx@xxx.xxx params[:body]
        @status = xxx@xxx.xxx
        flash[:notice] = "The email had been sent."
        format.html {redirect_to( xxx@xxx.xxx )}
      else
       xxx@xxx.xxx = "failed"
        format.html # section_email.html.erb
      end
      format.js
    end
  end
  
  def export_gradebook
    @section xxx@xxx.xxx
    
    csv_string = CSV.generate do |csv|
      assignments xxx@xxx.xxx
      
      csv << ["Tulsa Community College"]
      csv << xxx@xxx.xxx "Grade Scale", "A = 90-100%"]
      csv << [APP_CONFIG['ted_username'],"","","B = 80-89%"]
      csv << xxx@xxx.xxx = 70-79%"]
      csv << ["#{@section.course.short_name} - xxx@xxx.xxx = 60-69%"]
      csv << ["#{@section.semester.season}/#{@section.semester.year} xxx@xxx.xxx = < 60%"]
      csv << [] #blank row
      
      assignments_header = ["STUDENT NAME",	"Letter Grade",	"% Grade",	"Total Points",	"Total Absence",	"Participation", ""]
      assignments_header << assignments.map {|assignment| "#{assignment.title} - #{assignment.lab.title}"}
      csv << assignments_header.flatten
      
#       worth_header = ["worth"]
#       worth_header << assignments.map {|assignment| assignment.worth}
#       csv << worth_header.flatten
      
     xxx@xxx.xxx do |enrollment|
        line = []
        line << enrollment.student.last_name_first
        
        line << enrollment.current_grade
        line << enrollment.current_average / 100
        line << enrollment.current_points
        line << enrollment.attendances.where(attendance_status_id: AttendanceStatus.absent.id).count
        line << "-" # show hyphen for participation
        line << "" # blank for alignment with headings above
        
        
        assignments.each do |assignment|
          work = enrollment.works.where("assignment_id = ?", assignment.id).limit(1)
          if work.first
            line << work.first.score
          else
            line << "-"
          end
        end
        
        csv << line
      end
    end
    
    render plain: "<pre>#{csv_string}</pre>"
  end
  
  def sync_students
    @section xxx@xxx.xxx
   xxx@xxx.xxx

    redirect_to( xxx@xxx.xxx )
  end
  
  def allowed_params
    params.require(:section).permit(:course_id, :call_number, :section_number, :meeting_days, :room_number, :start_date, :end_date, :instructor_id, :start_time, :end_time)
  end
end
