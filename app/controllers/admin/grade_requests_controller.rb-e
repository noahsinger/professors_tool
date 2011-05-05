class Admin::GradeRequestsController < ApplicationController
  before_filter :authenticate
  
  # GET /grade_requests
  # GET /grade_requests.xml
  def index
   xxx@xxx.xxx = GradeRequest.find(:all, :order => 'created_at desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /grade_requests/1
  # GET /grade_requests/1.xml
  def show
   xxx@xxx.xxx = GradeRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # DELETE /grade_requests/1
  # DELETE /grade_requests/1.xml
  def destroy
   xxx@xxx.xxx = GradeRequest.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { redirect_to(admin_grade_requests_url) }
      format.xml  { head :ok }
    end
  end
  
  def destroy_all
   xxx@xxx.xxx = GradeRequest.find( :all )
   xxx@xxx.xxx do |grade_request|
      grade_request.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to(admin_grade_requests_url) }
      format.xml  { head :ok }
    end
  end
end
