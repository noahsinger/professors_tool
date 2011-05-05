class Admin::AwardedPointsController < ApplicationController
  before_filter :authenticate
  
  before_filter :load_semester
  before_filter :load_section
  before_filter :load_assignment
  before_filter :load_work
  
  def load_semester
   xxx@xxx.xxx = Semester.find( params[:semester_id] )
  end
  
  def load_section
   xxx@xxx.xxx = Section.find( params[:section_id] )
  end

  def load_assignment
   xxx@xxx.xxx = Assignment.find( params[:assignment_id] )
  end  
  
  def load_work
   xxx@xxx.xxx = Work.find( params[:work_id] )
  end

  # GET /awarded_points
  # GET /awarded_points.xml
  def index
    @awarded_points xxx@xxx.xxx
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /awarded_points/1
  # GET /awarded_points/1.xml
  def show
    @awarded_point xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /awarded_points/new
  # GET /awarded_points/new.xml
  def new
    @awarded_point xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /awarded_points/1/edit
  def edit
    @awarded_point xxx@xxx.xxx
  end

  # POST /awarded_points
  # POST /awarded_points.xml
  def create
    @awarded_point xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'AwardedPoint was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @awarded_point, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /awarded_points/1
  # PUT /awarded_points/1.xml
  def update
   xxx@xxx.xxx = AwardedPoint.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'AwardedPoint was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /awarded_points/1
  # DELETE /awarded_points/1.xml
  def destroy
   xxx@xxx.xxx = AwardedPoint.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { xxx@xxx.xxx @section, @assignment, @work )) }
      format.xml  { head :ok }
    end
  end
  
end
