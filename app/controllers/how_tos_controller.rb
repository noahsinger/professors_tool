class HowTosController < ApplicationController
  before_action :load_course
  
  def load_course
    @course = Course.find( params[:course_id] )
  end
  
  # GET /how_tos
  # GET /how_tos.xml
  def index
    @how_tos = @course.how_tos.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @how_tos }
    end
  end

  # GET /how_tos/1
  # GET /how_tos/1.xml
  def show
    @how_to = @course.how_tos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @how_to }
    end
  end
end
