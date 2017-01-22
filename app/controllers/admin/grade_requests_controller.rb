class Admin::GradeRequestsController < ApplicationController
  before_action :authenticate
  
  # GET /grade_requests
  # GET /grade_requests.xml
  def index
   xxx@xxx.xxx = GradeRequest.order('created_at desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # DELETE /grade_requests/1
  # DELETE /grade_requests/1.xml
  def destroy
   xxx@xxx.xxx = GradeRequest.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
     xxx@xxx.xxx = admin_grade_requests_url
      format.html { redirect_to(admin_grade_requests_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def destroy_all
   xxx@xxx.xxx = GradeRequest.all
   xxx@xxx.xxx do |grade_request|
      grade_request.destroy
    end
    
    respond_to do |format|
     xxx@xxx.xxx = admin_grade_requests_url
      format.html { redirect_to(admin_grade_requests_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:grade_request).permit(:email, :section, :student, :status)
  end
end
