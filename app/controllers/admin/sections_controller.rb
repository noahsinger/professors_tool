require 'csv'

class Admin::SectionsController < ApplicationController
  before_action :authenticate    
  before_action :load_semester

  def load_semester
    @semester = Semester.find( params[:semester_id] )
  end

  # GET /sections
  # GET /sections.xml
  def index
    @sections = @semester.sections.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @sections }
    end
  end

  # GET /sections/1
  # GET /sections/1.xml
  def show
    @section = @semester.sections.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @section }
    end
  end

  # GET /sections/new
  # GET /sections/new.xml
  def new
    @section = @semester.sections.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @section }
    end
  end

  # GET /sections/1/edit
  def edit
    @section = @semester.sections.find(params[:id])
  end

  # POST /sections
  # POST /sections.xml
  def create
    @section = @semester.sections.build(allowed_params)

    respond_to do |format|
      if @section.save
        num_waiters = @section.course.waiters.count
        @section.notify_waiters
        flash[:notice] = "Section was successfully created and #{num_waiters} were notified."
        @status = admin_semester_section_url(@semester,@section)
        format.html { redirect_to([:admin,@semester,@section]) }
        format.xml  { render xml: @section, status: :created, location: @section }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @section.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /sections/1
  # PUT /sections/1.xml
  def update
    @section = @semester.sections.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(allowed_params)
        @status = admin_semester_section_url(@semester,@section)
        flash[:notice] = 'Section was successfully updated.'
        format.html { redirect_to([:admin,@semester,@section]) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @section.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.xml
  def destroy
    @section = @semester.sections.find(params[:id])
    @section.destroy

    respond_to do |format|
      @status = admin_semester_sections_url(@semester)
      flash[:notice] = "The section has been destroyed"
      format.html { redirect_to(admin_semester_sections_url(@semester)) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def section_email
    @section = @semester.sections.find(params[:id])
    
    respond_to do |format|
      if params[:body] and params[:body] != ""
        @section.send_email params[:body]
        @status = admin_semester_section_url(@semester,@section)
        flash[:notice] = "The email had been sent."
        format.html {redirect_to( [:admin,@semester,@section] )}
      else
        @status = "failed"
        format.html # section_email.html.erb
      end
      format.js
    end
  end
  
  def export_gradebook
    @section = @semester.sections.find(params[:id])
    
    csv_string = CSV.generate do |csv|
      assignments = @section.assignments.except(:order).order(:duedate).all
      
      csv << ["Tulsa Community College"]
      csv << [@section.instructor.name,"", "Grade Scale", "A = 90-100%"]
      csv << [APP_CONFIG['ted_username'],"","","B = 80-89%"]
      csv << [@section.course.title,"","","C = 70-79%"]
      csv << ["#{@section.course.short_name} - (#{@section.call_number})","","","D = 60-69%"]
      csv << ["#{@section.semester.season}/#{@section.semester.year} (#{@section.semester.numeric})","","","F = < 60%"]
      csv << [] #blank row
      
      assignments_header = ["STUDENT NAME",	"Letter Grade",	"% Grade",	"Total Points",	"Total Absence",	"Participation", ""]
      assignments_header << assignments.map {|assignment| "#{assignment.title} - #{assignment.lab.title}"}
      csv << assignments_header.flatten
      
      @section.enrollments.each do |enrollment|
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
    
    # render plain: "#{csv_string}"
    send_data csv_string,
        type: "text/csv; charset=UTF-8;",
        disposition: "attachment; filename=#{@section.course.short_name}-#{@section.section_number}.csv"
  end
  
  def sync_students
    @section = @semester.sections.find(params[:id])
    @section.sync_students_with_ted

    respond_to do |format|
      @status = admin_semester_section_url(@semester,@section)
      format.html {redirect_to( [:admin,@semester,@section] )}
      format.js
    end
  end
  
  def allowed_params
    params.require(:section).permit(:course_id, :call_number, :section_number, :meeting_days, :room_number, :start_date, :end_date, :instructor_id, :start_time, :end_time)
  end
end
