class Admin::WaitersController < ApplicationController
  before_action :authenticate
  
  before_action :load_course
  
  def load_course
    @course = Course.find( params[:course_id] )
  end
  
  # GET /waiters
  # GET /waiters.json
  def index
    @waiters = @course.waiters.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @waiters }
    end
  end

  # DELETE /waiters/1
  # DELETE /waiters/1.json
  def destroy
    @waiter = @course.waiters.find(params[:id])
    @waiter.destroy

    respond_to do |format|
      @status = admin_course_waiters_url(@course)
      format.html { redirect_to admin_course_waiters_url(@course) }
      format.json { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:waiter).permit(:email)
  end
end
