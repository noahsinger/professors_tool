class StepsController < ApplicationController
  before_action :load_course
  before_action :load_section
  before_action :load_howto

  def load_section
    @section = Section.find( params[:section_id] ) if params[:section_id]
  end

  def load_course
    @course = Course.find( params[:course_id] )
  end

  def load_howto
    @how_to = HowTo.find( params[:how_to_id] )
  end

  # GET /steps/1
  # GET /steps/1.xml
  def show
    unless session[:referrer]
      session[:referrer] = request.referrer
    end

    @step = Step.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @step }
    end
  end
end
