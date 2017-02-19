class WaitersController < ApplicationController
  before_action :load_course
  
  def load_course
    @course = Course.find(params[:course_id])
  end
  
  # GET /waiters/new
  # GET /waiters/new.json
  def new
    @waiter = @course.waiters.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @waiter }
    end
  end

  # POST /waiters
  # POST /waiters.json
  def create
    @waiter = @course.waiters.build(allowed_params)

    respond_to do |format|
      if @waiter.save
        flash[:notice] = 'Thank you. You will be notified by email when this course becomes available.'
        @status = course_url(@course)
        format.html { redirect_to @course }
        format.json { render json: @waiter, status: :created, location: @waiter }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.json { render json: @waiter.errors, status: :unprocessable_entity }
      end
      
      format.js
    end
  end
  
  def allowed_params
    params.require(:waiter).permit(:email)
  end
end
