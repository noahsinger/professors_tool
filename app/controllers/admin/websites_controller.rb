class Admin::WebsitesController < ApplicationController
  before_action :authenticate  
  before_action :load_course
  
  def load_course
    @course = Course.find( params[:course_id] )
  end
  
  # GET /websites
  # GET /websites.json
  def index
    @websites = @course.websites.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @websites }
    end
  end

  # GET /websites/new
  # GET /websites/new.json
  def new
    @website = @course.websites.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @website }
    end
  end

  # GET /websites/1/edit
  def edit
    @website = Website.find(params[:id])
  end

  # POST /websites
  # POST /websites.json
  def create
    @website = @course.websites.build(allowed_params)

    respond_to do |format|
      if @website.save
        @status = admin_course_websites_url(@course)
        format.html { redirect_to admin_course_websites_url(@course), notice: 'Website was successfully created.' }
        format.json { render json: @website, status: :created, location: @website }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /websites/1
  # PUT /websites/1.json
  def update
    @website = @course.websites.find(params[:id])

    respond_to do |format|
      if @website.update_attributes(allowed_params)
        @status = admin_course_websites_url(@course)
        format.html { redirect_to admin_course_websites_url(@course), notice: 'Website was successfully updated.' }
        format.json { head :no_content }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /websites/1
  # DELETE /websites/1.json
  def destroy
    @website = @course.websites.find(params[:id])
    @website.destroy

    respond_to do |format|
      @status = admin_course_websites_url(@course)
      format.html { redirect_to admin_course_websites_url(@course) }
      format.json { head :no_content }
      format.js
    end
  end
  
  def allowed_params
    params.require(:website).permit(:title, :url)
  end 
end
