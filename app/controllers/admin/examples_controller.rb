class Admin::ExamplesController < ApplicationController
  before_action :authenticate
  before_action :load_semester
  before_action :load_section
  
  def load_semester
    @semester = Semester.find( params[:semester_id] )
  end
  
  def load_section
    @section = Section.find( params[:section_id] )
  end
  
  # GET /admin_examples
  # GET /admin_examples.xml
  def index
    @examples = @section.examples.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @examples }
    end
  end

  # GET /admin_examples/new
  # GET /admin_examples/new.xml
  def new
    @example = @section.examples.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @example }
    end
  end

  # GET /admin_examples/1/edit
  def edit
    @example = @section.examples.find(params[:id])
  end

  # POST /admin_examples
  # POST /admin_examples.xml
  def create
    @example = @section.examples.build(allowed_params)

    respond_to do |format|
      if @example.save
        @status = admin_semester_section_examples_url(@semester,@section)
        flash[:notice] = 'Example was successfully created.'
        format.html { redirect_to(admin_semester_section_examples_url(@semester,@section)) }
        format.xml  { render xml: @example, status: :created, location: @example }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @example.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /admin_examples/1
  # PUT /admin_examples/1.xml
  def update
    @example = @section.examples.find(params[:id])

    respond_to do |format|
      if @example.update_attributes(allowed_params)
        @status = admin_semester_section_examples_url(@semester,@section)
        flash[:notice] = 'Example was successfully updated.'
        format.html { redirect_to(admin_semester_section_examples_url(@semester,@section)) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @example.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /admin_examples/1
  # DELETE /admin_examples/1.xml
  def destroy
    @example = @section.examples.find(params[:id])
    @example.destroy

    respond_to do |format|
      @status = admin_semester_section_examples_url(@semester,@section)
      format.html { redirect_to(admin_semester_section_examples_url(@semester,@section)) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def allowed_params
    params.require(:example).permit(:name, :description, :file)
  end 
end
