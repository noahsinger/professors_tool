class WaitersController < ApplicationController
  before_action :load_course
  
  def load_course
   xxx@xxx.xxx = Course.find(params[:course_id])
  end
  
  # GET /waiters/new
  # GET /waiters/new.json
  def new
    @waiter xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # POST /waiters
  # POST /waiters.json
  def create
    @waiter xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Thank you. You will be notified by email when this course becomes available.'
        @status = xxx@xxx.xxx
        format.html { xxx@xxx.xxx }
        format.json { render json: @waiter, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.json { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      
      format.js
    end
  end
  
  def allowed_params
    params.require(:waiter).permit(:email)
  end
end
