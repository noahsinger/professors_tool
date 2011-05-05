class AssignmentsController < ApplicationController
  include ExceptionNotifiable
  
  before_filter :load_semester
  before_filter :load_section
  before_filter :clear_referrer
  
  def clear_referrer
    if session[:referrer]
      session[:referrer] = nil
    end
  end
  
  def load_semester
   xxx@xxx.xxx = Semester.find( params[:semester_id] )
  end
  
  def load_section
   xxx@xxx.xxx = Section.find( params[:section_id] )
  end
  
  # GET /assignments
  # GET /assignments.xml
  def index
    @assignments xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml xxx@xxx.xxx }
      format.rss { render :layout => false }
      format.ics { render :text xxx@xxx.xxx
      format.iphone
    end
  end

  # GET /assignments/1
  # GET /assignments/1.xml
  def show
    @assignment xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
      format.iphone
    end
  end
end
