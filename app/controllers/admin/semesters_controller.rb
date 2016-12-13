class Admin::SemestersController < ApplicationController
  before_action :authenticate

  # GET /semesters
  # GET /semesters.xml
  def index
   xxx@xxx.xxx = Semester.order('start_date desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /semesters/new
  # GET /semesters/new.xml
  def new
   xxx@xxx.xxx = Semester.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /semesters/1/edit
  def edit
   xxx@xxx.xxx = Semester.find(params[:id])
  end

  # POST /semesters
  # POST /semesters.xml
  def create
   xxx@xxx.xxx = Semester.new(allowed_params)

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Semester was successfully created.'
        @status = xxx@xxx.xxx
        format.html { xxx@xxx.xxx }
        format.xml  { render xml: @semester, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /semesters/1
  # PUT /semesters/1.xml
  def update
   xxx@xxx.xxx = Semester.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Semester was successfully updated.'
        @status = xxx@xxx.xxx
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "edit" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /semesters/1
  # DELETE /semesters/1.xml
  def destroy
   xxx@xxx.xxx = Semester.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      flash[:notice] = "The semester has been removed"
     xxx@xxx.xxx = admin_semesters_url
      format.html { redirect_to(admin_semesters_url) }
      format.xml  { head :ok }
      format.js
    end
  end

  def allowed_params
    params.require(:semester).permit(:year, :season, :start_date, :end_date)
  end
end
