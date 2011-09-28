class Admin::RequirementsController < ApplicationController
  before_filter :authenticate

  before_filter :load_lab
  before_filter :load_course
  
  def load_lab
   xxx@xxx.xxx = Lab.find( params[:lab_id] )
  end
  
  def load_course
   xxx@xxx.xxx = Course.find( params[:course_id] )
  end
  
  # GET /requirements/new
  # GET /requirements/new.xml
  def new
    @requirement xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /requirements/1/edit
  def edit
    @requirement xxx@xxx.xxx
  end

  # POST /requirements
  # POST /requirements.xml
  def create
    @requirement xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Requirement was successfully created.'
        # format.html { xxx@xxx.xxx }
        format.html { xxx@xxx.xxx }
        format.js
        format.xml  { render :xml => @requirement, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requirements/1
  # PUT /requirements/1.xml
  def update
    @requirement xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Requirement was successfully updated.'
        # format.html { xxx@xxx.xxx }
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.xml
  def destroy
    @requirement xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      format.html { xxx@xxx.xxx @lab )) }
      format.xml  { head :ok }
    end
  end
end
