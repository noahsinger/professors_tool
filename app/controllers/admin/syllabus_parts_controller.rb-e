class Admin::SyllabusPartsController < ApplicationController
  before_action :authenticate  
  before_action :store_referrer
  
  def store_referrer
    unless session[:referrer]
      session[:referrer] = request.referrer
    end
  end
  
  def new
   xxx@xxx.xxx = Course.find(params[:course_id])
   xxx@xxx.xxx = SyllabusPart.new
  end

  # GET /syllabus_parts/1/edit
  def edit
   xxx@xxx.xxx = Course.find(params[:course_id])
   xxx@xxx.xxx = SyllabusPart.find(params[:id])
  end

  # POST /syllabus_parts
  # POST /syllabus_parts.xml
  def create
   xxx@xxx.xxx = SyllabusPart.new(allowed_params)
   xxx@xxx.xxx = Course.find params[:course_id]

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'SyllabusPart was successfully created.'
        format.html {redirect_to(session[:referrer] || xxx@xxx.xxx
        format.xml  { render xml: @syllabus_part, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /syllabus_parts/1
  # PUT /syllabus_parts/1.xml
  def update
   xxx@xxx.xxx = SyllabusPart.find(params[:id])
   xxx@xxx.xxx = Course.find params[:course_id]

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'SyllabusPart was successfully updated.'
        format.html {redirect_to(session[:referrer] || xxx@xxx.xxx
        format.xml  { head :ok }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "edit" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /syllabus_parts/1
  # DELETE /syllabus_parts/1.xml
  def destroy
   xxx@xxx.xxx = SyllabusPart.find(params[:id])
   xxx@xxx.xxx = Course.find params[:course_id]
   xxx@xxx.xxx

    respond_to do |format|
      @status = xxx@xxx.xxx
      format.html {redirect_to(session[:referrer] || admin_syllabus_parts_url)}
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:syllabus_part).permit(:name, :title, :description)
  end
end
