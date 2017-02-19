class Admin::MeetingsController < ApplicationController
	before_action :authenticate
  
  before_action :load_section
  
  def load_section
    @section = Section.find( params[:section_id] )
  end

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = @section.meetings.all
    
    unless @meetings.size > 0
	  	@section.create_meetings
	  	@meetings = @section.meetings.all  
	  end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meetings }
    end
  end
  
  def allowed_params
    params.require(:meeting).permit(:when)
  end
end
