class Admin::SemestersController < ApplicationController
  before_filter :authenticate
  
  # GET /semesters
  # GET /semesters.xml
  def index
   xxx@xxx.xxx = Semester.find(:all, :order => 'start_date desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /semesters/1
  # GET /semesters/1.xml
  def show
   xxx@xxx.xxx = Semester.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /semesters/new
  # GET /semesters/new.xml
  def new
   xxx@xxx.xxx = Semester.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /semesters/1/edit
  def edit
   xxx@xxx.xxx = Semester.find(params[:id])
  end

  # POST /semesters
  # POST /semesters.xml
  def create
   xxx@xxx.xxx = Semester.new(params[:semester])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Semester was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @semester, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /semesters/1
  # PUT /semesters/1.xml
  def update
   xxx@xxx.xxx = Semester.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Semester was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /semesters/1
  # DELETE /semesters/1.xml
  def destroy
   xxx@xxx.xxx = Semester.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { redirect_to(admin_semesters_url) }
      format.xml  { head :ok }
    end
  end
end
