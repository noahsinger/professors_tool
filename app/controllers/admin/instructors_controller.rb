class Admin::InstructorsController < ApplicationController
  before_action :authenticate
  
  # GET /instructors
  # GET /instructors.xml
  def index
   xxx@xxx.xxx = Instructor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /instructors/1
  # GET /instructors/1.xml
  def show
   xxx@xxx.xxx = Instructor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /instructors/new
  # GET /instructors/new.xml
  def new
   xxx@xxx.xxx = Instructor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /instructors/1/edit
  def edit
   xxx@xxx.xxx = Instructor.find(params[:id])
  end

  # POST /instructors
  # POST /instructors.xml
  def create
   xxx@xxx.xxx = Instructor.new(allowed_params)

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Instructor was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render xml: @instructor, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /instructors/1
  # PUT /instructors/1.xml
  def update
   xxx@xxx.xxx = Instructor.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        @status = xxx@xxx.xxx
        flash[:notice] = 'Instructor was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "edit" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /instructors/1
  # DELETE /instructors/1.xml
  def destroy
   xxx@xxx.xxx = Instructor.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
     xxx@xxx.xxx =  admin_instructors_url
      format.html { redirect_to(admin_instructors_url) }
      format.xml  { head :ok }
      format.js
    end
  end

  def allowed_params
    params.require(:instructor).permit(:title, :first_name, :last_name, :email, :twitter_handle, :office_number, :phone_number, :division_id, :office_hours, :website)
  end 
end
