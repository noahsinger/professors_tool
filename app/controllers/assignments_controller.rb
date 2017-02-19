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
    @section = Section.includes(:semester,:examples,:course).find( params[:section_id] )
  end

  def load_semester
    @semester = @section.semester
  end
  
  # GET /assignments
  # GET /assignments.xml
  def index
    @assignments = @section.assignments.includes(:lab).visible

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @assignments }
      format.rss { render layout: false }
      format.ics { render text: @section.to_ical}
    end
  end

  # GET /assignments/1
  # GET /assignments/1.xml
  def show
    @assignment = @section.assignments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @assignment }
    end
  end
end
