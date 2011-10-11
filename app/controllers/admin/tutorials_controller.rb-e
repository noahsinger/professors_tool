class Admin::TutorialsController < ApplicationController
  before_filter :authenticate  

  before_filter :load_course
  before_filter :clear_referrer
  
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
   xxx@xxx.xxx = HowTo.find( :all )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.xml
  def destroy
    @tutorial xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
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
      format.html { render :nothing => true, :status => 200 }
      format.js
      format.xml  { head :ok }
    end
    
  end
  
  def add_how_to
    @tutorial = Tutorial.new( :course_id xxx@xxx.xxx :how_to_id => params[:how_to_id] )

    respond_to do |format|
      xxx@xxx.xxx
        format.js
        format.html { render :nothing => true, :status => 200 }
      else
        flash[:error] = 'There was a problem creating the tutorial.'
        format.html { render :action => "new" }
      end
    end     
  end
end
