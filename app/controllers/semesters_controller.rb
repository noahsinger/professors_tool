class SemestersController < ApplicationController
  # GET /semesters
  # GET /semesters.xml
  def index
   xxx@xxx.xxx = Semester.order('start_date desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /semesters/1
  # GET /semesters/1.xml
  def show
   xxx@xxx.xxx = Semester.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end
end
