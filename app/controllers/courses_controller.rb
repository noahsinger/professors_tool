class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.xml
  def index
    @courses = Course.order(:title).all

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
  
  def syllabus
    @course = Course.find params[:id]
  end
end
