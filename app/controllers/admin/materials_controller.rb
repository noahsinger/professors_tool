class Admin::MaterialsController < ApplicationController
  before_action :authenticate
  
  before_action :load_course
  
  def load_course
    @course = Course.find( params[:course_id] )
  end
  
  # GET /materials
  # GET /materials.xml
  def index
    @materials = @course.materials.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @materials }
    end
  end

  # GET /materials/new
  # GET /materials/new.xml
  def new
    @material = @course.materials.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @material }
    end
  end

  # GET /materials/1/edit
  def edit
    @material = @course.materials.find(params[:id])
  end

  # POST /materials
  # POST /materials.xml
  def create
    @material = @course.materials.new(allowed_params)

    respond_to do |format|
      if @material.save
        @status = admin_course_materials_url(@course)
        flash[:notice] = 'Material was successfully created.'
        format.html { redirect_to(admin_course_materials_url(@course)) }
        format.xml  { render xml: @material, status: :created, location: @material }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @material.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /materials/1
  # PUT /materials/1.xml
  def update
    @material = @course.materials.find(params[:id])

    respond_to do |format|
      if @material.update_attributes(allowed_params)
        @status = admin_course_materials_url(@course)
        flash[:notice] = 'Material was successfully updated.'
        format.html { redirect_to(admin_course_materials_url(@course)) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @material.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.xml
  def destroy
    @material = Material.find(params[:id])
    @material.destroy

    respond_to do |format|
      @status = admin_course_materials_url(@course)
      format.html { redirect_to(admin_course_materials_url(@course)) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:material).permit(:file, :title, :description)
  end
end
