class LabsController < ApplicationController
  before_action :load_course
  
  def load_course
    @course = Course.find( params[:course_id] )
  end
  
  # GET /labs
  # GET /labs.xml
  def index
    @labs = @course.labs.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @labs }
    end
  end

  # GET /labs/1
  # GET /labs/1.xml
  def show
    @lab = @course.labs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @lab }
    end
  end
end
