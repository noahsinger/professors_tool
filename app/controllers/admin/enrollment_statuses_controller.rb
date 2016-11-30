class Admin::EnrollmentStatusesController < ApplicationController
  before_action :authenticate
  
  # GET /enrollment_statuses
  # GET /enrollment_statuses.xml
  def index
   xxx@xxx.xxx = EnrollmentStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /enrollment_statuses/new
  # GET /enrollment_statuses/new.xml
  def new
   xxx@xxx.xxx = EnrollmentStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /enrollment_statuses/1/edit
  def edit
   xxx@xxx.xxx = EnrollmentStatus.find(params[:id])
  end

  # POST /enrollment_statuses
  # POST /enrollment_statuses.xml
  def create
   xxx@xxx.xxx = EnrollmentStatus.new(allowed_params)

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'EnrollmentStatus was successfully created.'
        format.html { redirect_to(admin_enrollment_statuses_url) }
        format.xml  { render :xml => @enrollment_status, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /enrollment_statuses/1
  # PUT /enrollment_statuses/1.xml
  def update
   xxx@xxx.xxx = EnrollmentStatus.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'EnrollmentStatus was successfully updated.'
        format.html { redirect_to(admin_enrollment_statuses_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollment_statuses/1
  # DELETE /enrollment_statuses/1.xml
  def destroy
   xxx@xxx.xxx = EnrollmentStatus.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { redirect_to(admin_enrollment_statuses_url) }
      format.xml  { head :ok }
    end
  end
  
  def allowed_params
    params.require(:enrollment_status).permit(:name)
  end 
end
