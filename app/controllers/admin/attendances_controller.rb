class Admin::AttendancesController < ApplicationController
	before_filter :authenticate  
	
  # GET /attendances
  # GET /attendances.json
  def index
   xxx@xxx.xxx = Attendance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
   xxx@xxx.xxx = Attendance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.json
  def new
   xxx@xxx.xxx = Attendance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # GET /attendances/1/edit
  def edit
   xxx@xxx.xxx = Attendance.find(params[:id])
  end

  # POST /attendances
  # POST /attendances.json
  def create
   xxx@xxx.xxx = Attendance.new(params[:attendance])

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
   xxx@xxx.xxx = Attendance.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        format.html { redirect_to xxx@xxx.xxx notice: 'Attendance was successfully updated.' }
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
   xxx@xxx.xxx = Attendance.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { redirect_to admin_attendances_url }
      format.json { head :no_content }
    end
  end
end
