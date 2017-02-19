class Admin::HomeworkReturnRequestsController < ApplicationController
  before_action :authenticate
  
  # GET /homework_return_requests
  # GET /homework_return_requests.xml
  def index
    @homework_return_requests = HomeworkReturnRequest.order('created_at desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @homework_return_requests }
    end
  end

  # DELETE /homework_return_requests/1
  # DELETE /homework_return_requests/1.xml
  def destroy
    @homework_return_request = HomeworkReturnRequest.find(params[:id])
    @homework_return_request.destroy

    respond_to do |format|
      @status = admin_homework_return_requests_url
      format.html { redirect_to(admin_homework_return_requests_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def destroy_all
    @requests = HomeworkReturnRequest.all
    @requests.each do |request|
      request.destroy
    end
    
    respond_to do |format|
      @status = admin_homework_return_requests_url
      format.html { redirect_to(admin_homework_return_requests_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:homework_return_request).permit(:email, :assignment, :enrollment, :status)
  end
end
