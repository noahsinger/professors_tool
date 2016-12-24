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
   xxx@xxx.xxx = Course.find( params[:course_id] )
  end
  
  # GET /how_tos/new
  # GET /how_tos/new.xml
  def new    
   xxx@xxx.xxx = HowTo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xxx@xxx.xxx }
    end
  end

  # GET /how_tos/1/edit
  def edit
   xxx@xxx.xxx = HowTo.find(params[:id])
  end

  # POST /how_tos
  # POST /how_tos.xml
  def create
   xxx@xxx.xxx = HowTo.new(allowed_params)

    respond_to do |format|
      xxx@xxx.xxx
        @status = admin_how_to_steps_url(@how_to, xxx@xxx.xxx
        flash[:notice] = 'HowTo was successfully created.'
        format.html { redirect_to(admin_how_to_steps_url(@how_to, xxx@xxx.xxx }
        format.xml  { render xml: @how_to, status: :created, xxx@xxx.xxx }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "new" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /how_tos/1
  # PUT /how_tos/1.xml
  def update
   xxx@xxx.xxx = HowTo.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        @status = admin_how_to_steps_url(@how_to, xxx@xxx.xxx
        flash[:notice] = 'HowTo was successfully updated.'
        format.html { redirect_to(admin_how_to_steps_url(@how_to, xxx@xxx.xxx }
        format.xml  { head :ok }
      else
       xxx@xxx.xxx = "failed"
        format.html { render action: "edit" }
        format.xml  { render xxx@xxx.xxx status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /how_tos/1
  # DELETE /how_tos/1.xml
  def destroy
   xxx@xxx.xxx = HowTo.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      @status = xxx@xxx.xxx
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
    end
  end
  
  def allowed_params
    params.require(:how_to).permit(:title, :description)
  end
end
