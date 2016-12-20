class Admin::WebsitesController < ApplicationController
  before_action :authenticate  
  before_action :load_course
  
  def load_course
   xxx@xxx.xxx = Course.find( params[:course_id] )
  end
  
  # GET /websites
  # GET /websites.json
  def index
    @websites xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # GET /websites/new
  # GET /websites/new.json
  def new
    @website xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # GET /websites/1/edit
  def edit
   xxx@xxx.xxx = Website.find(params[:id])
  end

  # POST /websites
  # POST /websites.json
  def create
    @website xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        format.html { redirect_to xxx@xxx.xxx notice: 'Website was successfully created.' }
        format.json { render json: @website, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.json { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /websites/1
  # PUT /websites/1.json
  def update
    @website xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        format.html { redirect_to xxx@xxx.xxx notice: 'Website was successfully updated.' }
        format.json { head :no_content }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "edit" }
        format.json { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /websites/1
  # DELETE /websites/1.json
  def destroy
    @website xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      @status = xxx@xxx.xxx
      format.html { redirect_to xxx@xxx.xxx }
      format.json { head :no_content }
      format.js
    end
  end
  
  def allowed_params
    params.require(:website).permit(:title, :url)
  end 
end
