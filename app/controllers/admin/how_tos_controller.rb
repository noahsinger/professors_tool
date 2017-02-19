class Admin::HowTosController < ApplicationController
  before_action :authenticate
  
  before_action :store_referrer
  before_action :load_course
  
  def store_referrer
    unless session[:referrer]
      session[:referrer] = request.referrer
    end
  end
  
  def load_course
    @course = Course.find( params[:course_id] )
  end
  
  # GET /how_tos/new
  # GET /how_tos/new.xml
  def new    
    @how_to = HowTo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @how_to }
    end
  end

  # GET /how_tos/1/edit
  def edit
    @how_to = HowTo.find(params[:id])
  end

  # POST /how_tos
  # POST /how_tos.xml
  def create
    @how_to = HowTo.new(allowed_params)

    respond_to do |format|
      if @how_to.save
        @status = admin_how_to_steps_url(@how_to, course_id: @course)
        flash[:notice] = 'HowTo was successfully created.'
        format.html { redirect_to(admin_how_to_steps_url(@how_to, course_id: @course)) }
        format.xml  { render xml: @how_to, status: :created, location: @how_to }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @how_to.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /how_tos/1
  # PUT /how_tos/1.xml
  def update
    @how_to = HowTo.find(params[:id])

    respond_to do |format|
      if @how_to.update_attributes(allowed_params)
        @status = admin_how_to_steps_url(@how_to, course_id: @course)
        flash[:notice] = 'HowTo was successfully updated.'
        format.html { redirect_to(admin_how_to_steps_url(@how_to, course_id: @course)) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @how_to.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /how_tos/1
  # DELETE /how_tos/1.xml
  def destroy
    @how_to = HowTo.find(params[:id])
    @how_to.destroy

    respond_to do |format|
      @status = admin_course_tutorials_url(@course)
      format.html { redirect_to(admin_course_tutorials_url(@course)) }
      format.xml  { head :ok }
    end
  end
  
  def allowed_params
    params.require(:how_to).permit(:title, :description)
  end
end
