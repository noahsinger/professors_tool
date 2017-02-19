class Admin::ExtrasController < ApplicationController
  before_action :authenticate
  
  before_action :load_course
  before_action :load_lab
  
  def load_course
    @course = Course.find( params[:course_id] )
  end
  
  def load_lab
    @lab = Lab.find( params[:lab_id] )
  end
  
  # GET /extras/new
  # GET /extras/new.xml
  def new
    @extra = @lab.extras.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @extra }
    end
  end

  # GET /extras/1/edit
  def edit
    @extra = @lab.extras.find(params[:id])
  end

  # POST /extras
  # POST /extras.xml
  def create
    @extra = @lab.extras.build(allowed_params)

    respond_to do |format|
      if @extra.save
        @status = admin_course_lab_url(@course,@lab)
        flash[:notice] = 'Extra was successfully created.'
        format.html { redirect_to([:admin,@course,@lab]) }
        format.xml  { render xml: @extra, status: :created, location: @extra }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @extra.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /extras/1
  # PUT /extras/1.xml
  def update
    @extra = @lab.extras.find(params[:id])

    respond_to do |format|
      if @extra.update_attributes(allowed_params)
        @status = admin_course_lab_url(@course,@lab)
        flash[:notice] = 'Extra was successfully updated.'
        format.html { redirect_to([:admin,@course,@lab]) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @extra.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /extras/1
  # DELETE /extras/1.xml
  def destroy
    @extra = Extra.find(params[:id])
    @extra.destroy

    respond_to do |format|
      @status = admin_course_lab_url(@course,@lab)
      format.html { redirect_to(admin_course_lab_url(@course,@lab)) }
      format.xml  { head :ok }
      format.js
    end
  end

  def allowed_params
    params.require(:extra).permit(:file, :description)
  end 
end
