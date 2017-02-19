class Admin::TutorialsController < ApplicationController
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
  
  # GET /tutorials
  # GET /tutorials.xml
  def index
    @tutorials = @course.tutorials.all
    @how_tos = HowTo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @tutorials }
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.xml
  def destroy
    @tutorial = @course.tutorials.find(params[:id])
    @tutorial.destroy

    respond_to do |format|
      @status = admin_course_tutorials_url(@course)
      format.html { redirect_to(admin_course_tutorials_url( @course )) }
      format.xml  { head :ok }
    end
  end
  
  def sort
    @course.tutorials.all.each do |t|
      if position = params[:tutorials].index(t.id.to_s)
        t.update_attribute(:position, position + 1) unless t.position == position + 1
      end
    end
    
    respond_to do |format|
      format.html { head :ok }
      format.js
      format.xml  { head :ok }
    end
    
  end
  
  def add_how_to
    @tutorial = Tutorial.new( course_id: @course.id, how_to_id: params[:how_to_id] )

    respond_to do |format|
      @status = admin_course_tutorials_path(@course)
      if @tutorial.save
        format.html { head :ok }
      else
        flash[:error] = 'There was a problem creating the tutorial.'
        format.html { render action: "new" }
      end
      format.js
    end
  end
  
  def allowed_params
    params.require(:tutorial).permit(:course_id, :how_to_id)
  end 
end
