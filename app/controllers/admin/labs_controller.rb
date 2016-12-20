class Admin::LabsController < ApplicationController
  before_action :authenticate
  
  before_action :load_course
  
  def load_course
   xxx@xxx.xxx = Course.find( params[:course_id] )
  end
  
  # GET /labs
  # GET /labs.xml
  def index
    @labs xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /labs/1
  # GET /labs/1.xml
  def show
    @lab xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /labs/new
  # GET /labs/new.xml
  def new
    @lab xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /labs/1/edit
  def edit
    @lab xxx@xxx.xxx
  end

  # POST /labs
  # POST /labs.xml
  def create
    @lab xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Lab was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render xml: @lab, status: :created, xxx@xxx.xxx }
      else
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
    end
  end

  # PUT /labs/1
  # PUT /labs/1.xml
  def update
    @lab xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Lab was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render action: "edit" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labs/1
  # DELETE /labs/1.xml
  def destroy
    @lab xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      format.html { xxx@xxx.xxx )) }
      format.xml  { head :ok }
    end
  end
  
  def allowed_params
    params.require(:lab).permit(:title, :objective, :instructions, :visible, :allow_uploads)
  end
end
