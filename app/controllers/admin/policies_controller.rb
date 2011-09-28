class Admin::PoliciesController < ApplicationController
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
  
  # GET /policies
  # GET /policies.xml
  def index
    @policies xxx@xxx.xxx
   xxx@xxx.xxx = SyllabusPart.find(:all, :order => 'name')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /policies/new
  # GET /policies/new.xml
  def new
    @policy xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # POST /policies
  # POST /policies.xml
  def create
    @policy xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Policy was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @policy, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /policies/1
  # DELETE /policies/1.xml
  def destroy
    @policy xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
    end
  end
  
  def sort
   xxx@xxx.xxx do |policy|
      if position = params[:policies].index(policy.id.to_s)
        policy.update_attribute(:position, position + 1) unless policy.position == position + 1
      end
    end
    # render :nothing => true, :status => 200
    
    respond_to do |format|
      format.html { render :nothing => true, :status => 200 }
      format.js
      format.xml  { head :ok }
    end
  end
  
  def add_syllabus_part
    @policy = Policy.new :course_id xxx@xxx.xxx :syllabus_part_id => params[:syllabus_part_id]

    respond_to do |format|
      xxx@xxx.xxx
        format.js
        format.html { render :nothing => true, :status => 200 }
      else
        flash[:notice] = 'There was a problem creating the policy.'
        format.html { render :action => "new" }
      end
    end 
  end
end
