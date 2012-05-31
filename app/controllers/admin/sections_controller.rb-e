class Admin::SectionsController < ApplicationController
  before_filter :authenticate    
  before_filter :load_semester

  def load_semester
   xxx@xxx.xxx = Semester.find( params[:semester_id] )
  end

  # GET /sections
  # GET /sections.xml
  def index
    @sections xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /sections/1
  # GET /sections/1.xml
  def show
    @section xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /sections/new
  # GET /sections/new.xml
  def new
    @section xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /sections/1/edit
  def edit
    @section xxx@xxx.xxx
  end

  # POST /sections
  # POST /sections.xml
  def create
    @section xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        num_waiters xxx@xxx.xxx
       xxx@xxx.xxx
        flash[:notice] = "Section was successfully created and #{num_waiters} were notified."
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @section, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sections/1
  # PUT /sections/1.xml
  def update
    @section xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'Section was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.xml
  def destroy
    @section xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      format.html { xxx@xxx.xxx }
      format.xml  { head :ok }
    end
  end
  
  def section_email
    @section xxx@xxx.xxx
    
    if params[:body] and params[:body] != ""
      
      # call_rake :send_section_email, :section_id xxx@xxx.xxx :body => params[:body]
     xxx@xxx.xxx params[:body]
      
      flash[:notice] = "The email had been sent."
      redirect_to( xxx@xxx.xxx )
    else
      respond_to do |format|
        format.html # status.html.erb
      end
    end    
  end
  
  def export_gradebook
	  require 'CSV'

    @section xxx@xxx.xxx
    
    csv_string = CSV.generate do |csv|
      assignments xxx@xxx.xxx
      
      assignments_header = ["assignments"]
      assignments_header << assignments.map {|assignment| "#{assignment.title} - #{assignment.lab.title}"}
      csv << assignments_header.flatten
      
      worth_header = ["worth"]
      worth_header << assignments.map {|assignment| assignment.worth}
      csv << worth_header.flatten
      
     xxx@xxx.xxx do |enrollment|
        line = []
        line << enrollment.student.last_name_first
        
        assignments.each do |assignment|
          work = enrollment.works.where("assignment_id = ?", assignment.id).limit(1)
          if work.first
            line << work.first.score
          else
            line << "-"
          end
        end
        
        csv << line
      end
    end
    
    render :text => "<pre>#{csv_string}</pre>"
  end
end





