class Admin::ExtrasController < ApplicationController
  before_action :authenticate
  
  before_action :load_course
  before_action :load_lab
  
  def load_course
   xxx@xxx.xxx = Course.find( params[:course_id] )
  end
  
  def load_lab
   xxx@xxx.xxx = Lab.find( params[:lab_id] )
  end
  
  # GET /extras/new
  # GET /extras/new.xml
  def new
    @extra xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /extras/1/edit
  def edit
    @extra xxx@xxx.xxx
  end

  # POST /extras
  # POST /extras.xml
  def create
    @extra xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Extra was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @extra, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /extras/1
  # PUT /extras/1.xml
  def update
    @extra xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Extra was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /extras/1
  # DELETE /extras/1.xml
  def destroy
   xxx@xxx.xxx = Extra.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
    end
  end

  def allowed_params
    params.require(:extra).permit(:file, :description)
  end 
end
