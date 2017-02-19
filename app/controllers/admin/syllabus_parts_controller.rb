class Admin::SyllabusPartsController < ApplicationController
  before_action :authenticate  
  before_action :store_referrer
  
  before_action :load_course
  
  def load_course
    @course = Course.find(params[:course_id])
  end
  
  def store_referrer
    unless session[:referrer]
      session[:referrer] = request.referrer
    end
  end
  
  def new
    @syllabus_part = SyllabusPart.new
  end

  # GET /syllabus_parts/1/edit
  def edit
    @syllabus_part = SyllabusPart.find(params[:id])
  end

  # POST /syllabus_parts
  # POST /syllabus_parts.xml
  def create
    @syllabus_part = SyllabusPart.new(allowed_params)

    respond_to do |format|
      if @syllabus_part.save
        @status = admin_course_policies_url(@course)
        flash[:notice] = 'SyllabusPart was successfully created.'
        format.html {redirect_to(admin_course_policies_url(@course))}
        format.xml  { render xml: @syllabus_part, status: :created, location: @syllabus_part }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @syllabus_part.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /syllabus_parts/1
  # PUT /syllabus_parts/1.xml
  def update
    @syllabus_part = SyllabusPart.find(params[:id])

    respond_to do |format|
      if @syllabus_part.update_attributes(allowed_params)
        @status = admin_course_policies_url(@course)
        flash[:notice] = 'SyllabusPart was successfully updated.'
        format.html {redirect_to(admin_course_policies_url(@course))}
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @syllabus_part.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /syllabus_parts/1
  # DELETE /syllabus_parts/1.xml
  def destroy
    @syllabus_part = SyllabusPart.find(params[:id])
    @syllabus_part.destroy

    respond_to do |format|
      @status = admin_course_policies_url(@course)
      format.html {redirect_to(session[:referrer] || admin_syllabus_parts_url)}
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:syllabus_part).permit(:name, :title, :description)
  end
end
