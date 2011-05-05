class RequirementsController < ApplicationController
  include ExceptionNotifiable
  
  before_filter :load_lab
  before_filter :load_course
  
  def load_lab
   xxx@xxx.xxx = Lab.find( params[:lab_id] )
  end
  
  def load_course
   xxx@xxx.xxx = Course.find( params[:course_id] )
  end
  
  # GET /requirements
  # GET /requirements.xml
  def index
    @requirements xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /requirements/1
  # GET /requirements/1.xml
  def show
    @requirement xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end
end
