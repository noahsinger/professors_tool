class SectionsController < ApplicationController
  before_action :load_semester

  def load_semester
    @semester = Semester.find(params[:semester_id])
  end

  # GET /sections
  # GET /sections.xml
  def index
    response.headers.delete "X-Frame-Options" #so the home page can be shown in a iframe
    @sections = @semester.sections.includes(:course).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @sections }
    end
  end

  # GET /sections/1
  # GET /sections/1.xml
  def show
    @section = @semester.sections.find(params[:id])

    # respond_to do |format|
      # format.html # show.html.erb
      # format.xml  { render xml: @section }
    # end

    redirect_to semester_section_assignments_path(@semester, @section)
  end

  def syllabus
    @section = @semester.sections.find(params[:id])
  end
end
