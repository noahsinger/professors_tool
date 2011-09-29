class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.xml
  def index
   xxx@xxx.xxx = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /courses/1
  # GET /courses/1.xml
  def show
   xxx@xxx.xxx = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end
end
