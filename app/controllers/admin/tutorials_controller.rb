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

  # GET /tutorials/1
  # GET /tutorials/1.xml
  def show
    @tutorial xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /tutorials/new
  # GET /tutorials/new.xml
  def new
    @tutorial xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /tutorials/1/edit
  def edit
    @tutorial xxx@xxx.xxx
  end

  # POST /tutorials
  # POST /tutorials.xml
  def create
    @tutorial xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Tutorial was successfully created.'
        format.html { xxx@xxx.xxx )) }
        format.xml  { render :xml => @tutorial, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tutorials/1
  # PUT /tutorials/1.xml
  def update
   xxx@xxx.xxx = Tutorial.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Tutorial was successfully updated.'
        format.html { xxx@xxx.xxx )) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
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
    # render :nothing => true, :status => 200
    
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
        flash[:notice] = 'There was a problem creating the tutorial.'
        format.html { render :action => "new" }
      end
    end     
  end
end
