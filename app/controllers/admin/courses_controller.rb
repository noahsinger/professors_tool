class Admin::CoursesController < ApplicationController
  before_action :authenticate
  before_action :clear_referrer
  
  def clear_referrer
    if session[:referrer]
      session[:referrer] = nil
    end
  end
  
  # GET /courses
  # GET /courses.xml
  def index
    @courses = Course.order(:title)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.xml
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.xml
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.xml
  def create
    @course = Course.new(allowed_params)

    respond_to do |format|
      if @course.save
        @status = admin_course_url(@course)
        flash[:notice] = 'Course was successfully created.'
        format.html { redirect_to([:admin,@course]) }
        format.xml  { render xml: @course, status: :created, location: @course }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @course.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /courses/1
  # PUT /courses/1.xml
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(allowed_params)
        @status = admin_course_url(@course)
        flash[:notice] = 'Course was successfully updated.'
        format.html { redirect_to([:admin,@course]) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @course.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.xml
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      @status = admin_courses_url
      format.html { redirect_to(admin_courses_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:course).permit(:title, :description, :discipline, :number, :credits, :prerequisite, :next_course, :required_materials)
  end 
end
