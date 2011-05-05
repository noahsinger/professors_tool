class Admin::SyllabusPartsController < ApplicationController
  before_filter :authenticate
  before_filter :store_referrer
  
  def store_referrer
    unless session[:referrer]
      session[:referrer] = request.referrer
    end
  end
  
  # GET /syllabus_parts
  # GET /syllabus_parts.xml
  def index
   xxx@xxx.xxx = SyllabusPart.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /syllabus_parts/1
  # GET /syllabus_parts/1.xml
  def show
   xxx@xxx.xxx = SyllabusPart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /syllabus_parts/new
  # GET /syllabus_parts/new.xml
  def new
   xxx@xxx.xxx = SyllabusPart.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /syllabus_parts/1/edit
  def edit
   xxx@xxx.xxx = SyllabusPart.find(params[:id])
  end

  # POST /syllabus_parts
  # POST /syllabus_parts.xml
  def create
   xxx@xxx.xxx = SyllabusPart.new(params[:syllabus_part])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'SyllabusPart was successfully created.'
        format.js
        format.html {redirect_to(session[:referrer])}
        format.xml  { render :xml => @syllabus_part, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /syllabus_parts/1
  # PUT /syllabus_parts/1.xml
  def update
   xxx@xxx.xxx = SyllabusPart.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'SyllabusPart was successfully updated.'
        # format.html { xxx@xxx.xxx }
        format.html {redirect_to( session[:referrer] )}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /syllabus_parts/1
  # DELETE /syllabus_parts/1.xml
  def destroy
   xxx@xxx.xxx = SyllabusPart.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      # format.html { redirect_to(admin_syllabus_parts_url) }
      format.html {redirect_to(session[:referrer])}
      format.xml  { head :ok }
    end
  end
end
