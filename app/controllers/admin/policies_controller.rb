class Admin::PoliciesController < ApplicationController
  before_action :authenticate
  
  before_action :load_course
  before_action :clear_referrer
  
  def clear_referrer
    if session[:referrer]
      session[:referrer] = nil
    end
  end
  
  def load_course
    @course = Course.find( params[:course_id] )
  end
  
  # GET /policies
  # GET /policies.xml
  def index
    @policies = @course.policies.all
    @syllabus_parts = SyllabusPart.order('name')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @policies }
    end
  end

  # POST /policies
  # POST /policies.xml
  def create
    @policy = @course.policies.build(allowed_params)

    respond_to do |format|
      if @policy.save
        flash[:notice] = 'Policy was successfully created.'
        format.html { redirect_to([:admin,@course]) }
        format.xml  { render xml: @policy, status: :created, location: @policy }
      else
        format.html { render action: "new" }
        format.xml  { render xml: @policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /policies/1
  # DELETE /policies/1.xml
  def destroy
    @policy = @course.policies.find(params[:id])
    @policy.destroy

    respond_to do |format|
      format.html { redirect_to(admin_course_policies_url(@course)) }
      format.xml  { head :ok }
    end
  end
  
  def sort
    @course.policies.all.each do |policy|
      if position = params[:policies].index(policy.id.to_s)
        policy.update_attribute(:position, position + 1) unless policy.position == position + 1
      end
    end
    
    respond_to do |format|
      format.html { head :ok }
      format.js
      format.xml  { head :ok }
    end
  end
  
  def add_syllabus_part
    @policy = Policy.new(course_id: @course.id.to_i, syllabus_part_id: params[:syllabus_part_id])

    respond_to do |format|
      @status = admin_course_policies_url(@course)
      if @policy.save
        format.html { head :ok }
      else
        flash[:error] = 'There was a problem creating the policy.'
        format.html { render action: "new" }
      end
      format.js
    end 
  end
  
  def allowed_params
    params.require(:policy).permit(:course_id, :syllabus_part_id)
  end
end
