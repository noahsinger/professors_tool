class Admin::ExamplesController < ApplicationController
  before_action :authenticate
  before_action :load_semester
  before_action :load_section
  
  def load_semester
   xxx@xxx.xxx = Semester.find( params[:semester_id] )
  end
  
  def load_section
   xxx@xxx.xxx = Section.find( params[:section_id] )
  end
  
  # GET /admin_examples
  # GET /admin_examples.xml
  def index
    @examples xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /examples/1
  # GET /examples/1.xml
  def show
    @example xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /admin_examples/new
  # GET /admin_examples/new.xml
  def new
    @example xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /admin_examples/1/edit
  def edit
    @example xxx@xxx.xxx
  end

  # POST /admin_examples
  # POST /admin_examples.xml
  def create
    @example xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Example was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render xml: @example, status: :created, xxx@xxx.xxx }
      else
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin_examples/1
  # PUT /admin_examples/1.xml
  def update
    @example xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Example was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render action: "edit" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_examples/1
  # DELETE /admin_examples/1.xml
  def destroy
    @example xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
    end
  end
  
  def allowed_params
    params.require(:example).permit(:name, :description, :file)
  end 
end
