class Admin::TutorialsController < ApplicationController
  before_action :authenticate  

  before_action :load_course
  before_action :clear_referrer
  
  def clear_referrer
    if session[:referrer]
      session[:referrer] = nil
    end
  end
  
  def load_course
   xxx@xxx.xxx = Course.find( params[:course_id] )
  end
  
  # GET /tutorials
  # GET /tutorials.xml
  def index
    @tutorials xxx@xxx.xxx
   xxx@xxx.xxx = HowTo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.xml
  def destroy
    @tutorial xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      @status = xxx@xxx.xxx
      format.html { xxx@xxx.xxx )) }
      format.xml  { head :ok }
    end
  end
  
  def sort
   xxx@xxx.xxx do |t|
      if position = params[:tutorials].index(t.id.to_s)
        t.update_attribute(:position, position + 1) unless t.position == position + 1
      end
    end
    
    respond_to do |format|
      format.html { head :ok }
      format.js
      format.xml  { head :ok }
    end
    
  end
  
  def add_how_to
    @tutorial = Tutorial.new( xxx@xxx.xxx how_to_id: params[:how_to_id] )

    respond_to do |format|
      @status = xxx@xxx.xxx
      xxx@xxx.xxx
        format.html { head :ok }
      else
        flash[:error] = 'There was a problem creating the tutorial.'
        format.html { render action: "new" }
      end
      format.js
    end
  end
  
  def allowed_params
    params.require(:tutorial).permit(:course_id, :how_to_id)
  end 
end
