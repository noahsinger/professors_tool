class Admin::MeetingsController < ApplicationController
	before_action :authenticate
  
  before_action :load_section
  
  def load_section
   xxx@xxx.xxx = Section.find( params[:section_id] )
  end

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings xxx@xxx.xxx
    
    xxx@xxx.xxx > 0
	  xxx@xxx.xxx
	  	@meetings xxx@xxx.xxx  
	  end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end
  
  def allowed_params
    params.require(:meeting).permit(:when)
  end
end
