class SemestersController < ApplicationController
  # GET /semesters
  # GET /semesters.xml
  def index
   xxx@xxx.xxx = Semester.order('start_date desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  def current
    respond_to do |format|
      if Semester.current
        format.html { redirect_to semester_sections_url(Semester.current) }
        format.json { render json: Semester.current, status: :ok, location: Semester.current }
      elsif Semester.future.first
        format.html { redirect_to semester_sections_url(Semester.future.first) }
        format.json { render json: Semester.future.first, status: :ok, location: Semester.future.first }
      else
       xxx@xxx.xxx = Semester.order('start_date desc')
        format.html { render :index }
        format.json  { render xxx@xxx.xxx }
      end
    end
  end
end
