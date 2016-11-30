class AssignmentsController < ApplicationController
  before_action :load_section
  before_action :load_semester
  before_action :clear_referrer
  
  def clear_referrer
    if session[:referrer]
      session[:referrer] = nil
    end
  end
  
  def load_section
   xxx@xxx.xxx = Section.includes(:semester,:examples,:course).find( params[:section_id] )
  end

  def load_semester
    @semester xxx@xxx.xxx
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
    end
  end

  # GET /assignments/1
  # GET /assignments/1.xml
  def show
    @assignment xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end
end
