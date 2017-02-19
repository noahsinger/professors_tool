class Admin::GradeRequestsController < ApplicationController
  before_action :authenticate
  
  # GET /grade_requests
  # GET /grade_requests.xml
  def index
    @grade_requests = GradeRequest.order('created_at desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @grade_requests }
    end
  end

  # DELETE /grade_requests/1
  # DELETE /grade_requests/1.xml
  def destroy
    @grade_request = GradeRequest.find(params[:id])
    @grade_request.destroy

    respond_to do |format|
      @status = admin_grade_requests_url
      format.html { redirect_to(admin_grade_requests_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def destroy_all
    @grade_requests = GradeRequest.all
    @grade_requests.each do |grade_request|
      grade_request.destroy
    end
    
    respond_to do |format|
      @status = admin_grade_requests_url
      format.html { redirect_to(admin_grade_requests_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:grade_request).permit(:email, :section, :student, :status)
  end
end
