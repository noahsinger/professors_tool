class StepsController < ApplicationController
  include ExceptionNotifiable
    
  before_filter :load_course
  before_filter :load_howto
  
  def load_course
   xxx@xxx.xxx = Course.find( params[:course_id] )
  end
  
  def load_howto
   xxx@xxx.xxx = HowTo.find( params[:how_to_id] )
  end
  
  # GET /steps/1
  # GET /steps/1.xml
  def show
    unless session[:referrer]
      session[:referrer] = request.referrer
    end
    
   xxx@xxx.xxx = Step.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
      format.iphone
    end
  end
end
