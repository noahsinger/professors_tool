class Admin::CoursesController < ApplicationController
  before_filter :authenticate
  before_filter :clear_referrer
  
  def clear_referrer
    if session[:referrer]
      session[:referrer] = nil
    end
  end
  
  # GET /courses
  # GET /courses.xml
  def index
   xxx@xxx.xxx = Course.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /courses/1
  # GET /courses/1.xml
  def show
   xxx@xxx.xxx = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /courses/new
  # GET /courses/new.xml
  def new
   xxx@xxx.xxx = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /courses/1/edit
  def edit
   xxx@xxx.xxx = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.xml
  def create
   xxx@xxx.xxx = Course.new(params[:course])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Course was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @course, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.xml
  def update
   xxx@xxx.xxx = Course.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Course was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.xml
  def destroy
   xxx@xxx.xxx = Course.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { redirect_to(admin_courses_url) }
      format.xml  { head :ok }
    end
  end  
end