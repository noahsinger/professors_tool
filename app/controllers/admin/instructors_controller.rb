class Admin::InstructorsController < ApplicationController
  before_action :authenticate
  
  # GET /instructors
  # GET /instructors.xml
  def index
    @instructors = Instructor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @instructors }
    end
  end

  # GET /instructors/1
  # GET /instructors/1.xml
  def show
    @instructor = Instructor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @instructor }
    end
  end

  # GET /instructors/new
  # GET /instructors/new.xml
  def new
    @instructor = Instructor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @instructor }
    end
  end

  # GET /instructors/1/edit
  def edit
    @instructor = Instructor.find(params[:id])
  end

  # POST /instructors
  # POST /instructors.xml
  def create
    @instructor = Instructor.new(allowed_params)

    respond_to do |format|
      if @instructor.save
        @status = admin_instructor_url(@instructor)
        flash[:notice] = 'Instructor was successfully created.'
        format.html { redirect_to([:admin,@instructor]) }
        format.xml  { render xml: @instructor, status: :created, location: @instructor }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @instructor.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /instructors/1
  # PUT /instructors/1.xml
  def update
    @instructor = Instructor.find(params[:id])

    respond_to do |format|
      if @instructor.update_attributes(allowed_params)
        @status = admin_instructor_url(@instructor)
        flash[:notice] = 'Instructor was successfully updated.'
        format.html { redirect_to([:admin,@instructor]) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @instructor.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /instructors/1
  # DELETE /instructors/1.xml
  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy

    respond_to do |format|
      @status =  admin_instructors_url
      format.html { redirect_to(admin_instructors_url) }
      format.xml  { head :ok }
      format.js
    end
  end

  def allowed_params
    params.require(:instructor).permit(:title, :first_name, :last_name, :email, :twitter_handle, :office_number, :phone_number, :division_id, :office_hours, :website)
  end 
end
