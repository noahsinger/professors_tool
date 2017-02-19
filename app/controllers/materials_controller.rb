class MaterialsController < ApplicationController
  before_action :load_course

  def load_course
    if params[:section_id]
      @section = Section.find params[:section_id]
    end

    @course = Course.find( params[:course_id] )
  end

  # GET /materials
  # GET /materials.xml
  def index
    @materials = @course.materials.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @materials }
    end
  end
end
