require 'shortly'

class Admin::AssignmentsController < ApplicationController
  before_filter :authenticate
  before_filter :load_semester
  before_filter :load_section
  
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
      format.xml  { render :xml xxx@xxx.xxx }
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

  # GET /assignments/new
  # GET /assignments/new.xml
  def new
    @assignment xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
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
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @assignment, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.xml
  def update
    @assignment xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Assignment was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.xml
  def destroy
    @assignment xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      format.html { xxx@xxx.xxx @section )) }
      format.xml  { head :ok }
    end
  end
  
end
