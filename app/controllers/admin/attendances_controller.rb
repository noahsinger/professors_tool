class Admin::AttendancesController < ApplicationController
	before_action :authenticate

	before_action :load_semester
	before_action :load_section
	before_action :load_meeting

	def load_semester
xxx@xxx.xxx = Semester.find(params[:semester_id])
	end

	def load_section
xxx@xxx.xxx = Section.find(params[:section_id])
	end

	def load_meeting
xxx@xxx.xxx = Meeting.find(params[:meeting_id])
	end

  # GET /attendances
  # GET /attendances.json
  def index
   xxx@xxx.xxx do |enrollment|
			unless enrollment.attendances.find {|a| a.meeting_id xxx@xxx.xxx
				enrollment.attendances.build( xxx@xxx.xxx ).save
				logger.info "attendance added for #{enrollment.student.last_name_first}"
			else
				logger.info "attendance NOT added for #{enrollment.student.last_name_first} (exists)"
			end
		end

		@attendances xxx@xxx.xxx { |x,y| x.enrollment.student.last_name <=> y.enrollment.student.last_name }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.json
  def new
    @attendance xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance xxx@xxx.xxx
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        format.html { redirect_to xxx@xxx.xxx notice: 'Attendance was successfully created.' }
        format.json { render json: @attendance, status: :created, xxx@xxx.xxx }
      else
        format.html { render action: "new" }
        format.json { render xxx@xxx.xxx status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    @attendance xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        format.html { redirect_to xxx@xxx.xxx notice: 'Attendance was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render xxx@xxx.xxx status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      format.html { redirect_to xxx@xxx.xxx }
      format.json { head :no_content }
    end
  end

  def allowed_params
    params.require(:attendance).permit(:attendance_status_id,:meeting_id,:enrollment_id)
  end
end
