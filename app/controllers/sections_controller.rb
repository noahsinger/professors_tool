class SectionsController < ApplicationController
  before_action :load_semester

  def load_semester
   xxx@xxx.xxx = Semester.find(params[:semester_id])
  end

  # GET /sections
  # GET /sections.xml
  def index
    response.headers.delete "X-Frame-Options" #so the home page can be shown in a iframe
    @sections xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /sections/1
  # GET /sections/1.xml
  def show
    @section xxx@xxx.xxx

    # respond_to do |format|
      # format.html # show.html.erb
      # format.xml  { render xxx@xxx.xxx }
    # end

    redirect_to xxx@xxx.xxx @section)
  end

  def syllabus
    @section xxx@xxx.xxx
  end
end
