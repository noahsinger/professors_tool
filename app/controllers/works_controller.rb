class WorksController < ApplicationController
  before_action :load_semester
  before_action :load_section
  before_action :load_assignment
  
  def load_semester
    @semester = Semester.find( params[:semester_id] )
  end
  
  def load_section
    @section = Section.find( params[:section_id] )
  end

  def load_assignment
    @assignment = Assignment.find( params[:assignment_id] )
  end  
  
  # GET /works/new
  # GET /works/new.xml
  def new
    @work = @assignment.works.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @work }
    end
  end

  # POST /works
  # POST /works.xml
  def create
    @work = @assignment.works.build(allowed_params)
    @work.email.downcase!

    respond_to do |format|
      # make this work one with the assignment
      @work.assignment_id = @assignment.id
      
      # try to find the student who this assignment belongs to (based on the submitting email address)
      student = Student.where('email=?', params[:work][:email].downcase).first
      
      if student
        # if a student is found with a matching email address attribute the assignment to them
        @work.enrollment = student.enrollments.where('section_id=?',@section.id).first
      end
      
      # check if a work has already been submitted from this submission address
      prev_works = @assignment.works.where('email=?', params[:work][:email].downcase)

      # if the work wasn't previously submitted
      if prev_works.size == 0
        # save the work
        if @work.save
          flash[:notice] = 'Your work was successfully uploaded.'
        
          # send the student an email including the withdrawal link
          @work.send_submitted_email params[:work][:email].downcase
        
          @status = semester_section_assignment_url(@semester,@section,@assignment)
          format.html { redirect_to([@semester,@section,@assignment]) } 
          format.xml  { render xml: @work, status: :created, location: @work }
        else
          @status = "failed"
          format.html { render action: "new" }
          format.xml  { render xml: @work.errors, status: :unprocessable_entity }
        end
      else
          @work.errors.add :email, 'has already submitted this work. If you want to resubmit, you must first withdraw your previous submission (check your email)'
        
          # send the submitter a reminder including the withdrawal link
          prev_works[0].send_reminder_email # params[:work][:email]
        
          @status = "failed"
          format.html { render action: "new" }
          format.xml  { render xml: @work.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end
  
  def withdraw
    @condition = ""
    
    if params[:code]
      @works = @assignment.works.where('withdrawal_code=?',params[:code])
      
      if @works.size > 0
        @works.each do |work|
          if work.withdrawal_code == params[:code]
            if work.assignment.duedate < Time.now
              @condition = "pastdue"
            else
              work.destroy
              @condition = "destroyed"
            end
          end
        end
      else
        @condition = "no works"  
      end
    else
      @condition = "no code"
    end
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def allowed_params
    params.require(:work).permit(:upload, :email, :enrollment_id, :instructors_comments, :assignment_id)
  end
end
