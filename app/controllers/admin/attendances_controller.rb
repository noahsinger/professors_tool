class Admin::AttendancesController < ApplicationController
	before_action :authenticate

	before_action :load_semester
	before_action :load_section
	before_action :load_meeting

	def load_semester
		@semester = Semester.find(params[:semester_id])
	end

	def load_section
		@section = Section.find(params[:section_id])
	end

	def load_meeting
		@meeting = Meeting.find(params[:meeting_id])
	end

  # GET /attendances
  # GET /attendances.json
  def index
    @section.enrollments.each do |enrollment|
			unless enrollment.attendances.find {|a| a.meeting_id == @meeting.id}
				enrollment.attendances.build( meeting_id: @meeting.id ).save
				logger.info "attendance added for #{enrollment.student.last_name_first}"
			else
				logger.info "attendance NOT added for #{enrollment.student.last_name_first} (exists)"
			end
		end

		@attendances = @meeting.attendances.all.sort { |x,y| x.enrollment.student.last_name <=> y.enrollment.student.last_name }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendances }
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    @attendance = @meeting.attendances.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(allowed_params)
        format.html { redirect_to admin_semester_section_meeting_attendances_url(@semester,@section,@meeting), notice: 'Attendance was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def allowed_params
    params.require(:attendance).permit(:attendance_status_id,:meeting_id,:enrollment_id)
  end
end
