class Admin::StepsController < ApplicationController
  before_filter :authenticate
  
  before_filter :load_howto
  
  def load_howto
   xxx@xxx.xxx = HowTo.find( params[:how_to_id] )
  end
  
  # GET /steps
  # GET /steps.xml
  def index
    @steps xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /steps/1
  # GET /steps/1.xml
  def show
    @step xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /steps/new
  # GET /steps/new.xml
  def new
    @step xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /steps/1/edit
  def edit
    @step xxx@xxx.xxx
  end

  # POST /steps
  # POST /steps.xml
  def create
    @step xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Step was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @step, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /steps/1
  # PUT /steps/1.xml
  def update
    @step xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Step was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.xml
  def destroy
    @step xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
    end
  end
  
  def sort
   xxx@xxx.xxx do |step|
      if position = params[:steps].index(step.id.to_s)
        step.update_attribute(:position, position + 1) unless step.position == position + 1
      end
    end
    
    respond_to do |format|
      format.html { render :nothing => true, :status => 200 }
      format.js
      format.xml  { head :ok }
    end
  end
end
