class Admin::HomeworkReturnRequestsController < ApplicationController
  before_action :authenticate
  
  # GET /homework_return_requests
  # GET /homework_return_requests.xml
  def index
   xxx@xxx.xxx = HomeworkReturnRequest.order('created_at desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # DELETE /homework_return_requests/1
  # DELETE /homework_return_requests/1.xml
  def destroy
   xxx@xxx.xxx = HomeworkReturnRequest.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
     xxx@xxx.xxx = admin_homework_return_requests_url
      format.html { redirect_to(admin_homework_return_requests_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def destroy_all
   xxx@xxx.xxx = HomeworkReturnRequest.all
   xxx@xxx.xxx do |request|
      request.destroy
    end
    
    respond_to do |format|
     xxx@xxx.xxx = admin_homework_return_requests_url
      format.html { redirect_to(admin_homework_return_requests_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:homework_return_request).permit(:email, :assignment, :enrollment, :status)
  end
end
