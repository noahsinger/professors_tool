class SectionsController < ApplicationController
  before_filter :load_semester
  
  def load_semester
   xxx@xxx.xxx = Semester.find( params[:semester_id] )
  end
  
  # GET /sections
  # GET /sections.xml
  def index
    @sections xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
      format.iphone
    end
  end

  # GET /sections/1
  # GET /sections/1.xml
  def show
    @section xxx@xxx.xxx

    # respond_to do |format|
      # format.html # show.html.erb
      # format.xml  { render :xml xxx@xxx.xxx }
    # end
    
    redirect_to xxx@xxx.xxx @section)
  end
  
  def syllabus
    @section xxx@xxx.xxx
  end
end
