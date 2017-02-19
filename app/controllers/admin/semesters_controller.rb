class Admin::SemestersController < ApplicationController
  before_action :authenticate

  # GET /semesters
  # GET /semesters.xml
  def index
    @semesters = Semester.order('start_date desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @semesters }
    end
  end

  # GET /semesters/new
  # GET /semesters/new.xml
  def new
    @semester = Semester.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @semester }
    end
  end

  # GET /semesters/1/edit
  def edit
    @semester = Semester.find(params[:id])
  end

  # POST /semesters
  # POST /semesters.xml
  def create
    @semester = Semester.new(allowed_params)

    respond_to do |format|
      if @semester.save
        flash[:notice] = 'Semester was successfully created.'
        @status = admin_semester_sections_url(@semester)
        format.html { redirect_to(admin_semester_sections_url(@semester)) }
        format.xml  { render xml: @semester, status: :created, location: @semester }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @semester.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /semesters/1
  # PUT /semesters/1.xml
  def update
    @semester = Semester.find(params[:id])

    respond_to do |format|
      if @semester.update_attributes(allowed_params)
        flash[:notice] = 'Semester was successfully updated.'
        @status = admin_semester_sections_url(@semester)
        format.html { redirect_to(admin_semester_sections_url(@semester)) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @semester.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /semesters/1
  # DELETE /semesters/1.xml
  def destroy
    @semester = Semester.find(params[:id])
    @semester.destroy

    respond_to do |format|
      flash[:notice] = "The semester has been removed"
      @status = admin_semesters_url
      format.html { redirect_to(admin_semesters_url) }
      format.xml  { head :ok }
      format.js
    end
  end

  def allowed_params
    params.require(:semester).permit(:year, :season, :start_date, :end_date)
  end
end
