class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.xml
  def index
   xxx@xxx.xxx = Course.order(:title).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /courses/1
  # GET /courses/1.xml
  def show
   xxx@xxx.xxx = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end
  
  def syllabus
   xxx@xxx.xxx = Course.find params[:id]
  end
end
