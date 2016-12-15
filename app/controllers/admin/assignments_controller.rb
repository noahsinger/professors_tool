require 'shortly'

class Admin::AssignmentsController < ApplicationController
  before_action :authenticate
  before_action :load_semester
  before_action :load_section

  def load_semester
   xxx@xxx.xxx = Semester.find( params[:semester_id] )
  end

  def load_section
   xxx@xxx.xxx = Section.find( params[:section_id] )
  end

  # GET /assignments
  # GET /assignments.xml
  def index
    @assignments xxx@xxx.xxx desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.xml
  def show
    @assignment xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.xml
  def new
    @assignment xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /assignments/1/edit
  def edit
    @assignment xxx@xxx.xxx
  end

  # POST /assignments
  # POST /assignments.xml
  def create
    @assignment xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Assignment was successfully created.'
        @status = xxx@xxx.xxx status: 'new')
        format.html { xxx@xxx.xxx status: 'new')) }
        format.xml  { render xml: @assignment, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.xml
  def update
    @assignment xxx@xxx.xxx
    old_duedate xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Assignment was successfully updated.'

        destination = xxx@xxx.xxx
        xxx@xxx.xxx == old_duedate
          destination = xxx@xxx.xxx status: "duedate")
        end

       xxx@xxx.xxx = destination
        format.html { redirect_to(destination) }
        format.xml  { head :ok }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "edit" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.xml
  def destroy
    @assignment xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      @status = xxx@xxx.xxx @section)
      format.html { xxx@xxx.xxx @section)) }
      format.xml  { head :ok }
      format.js
    end
  end

  def allowed_params
    params.require(:assignment).permit(:title, :lab, :duedate, :lab_id)
  end

end
