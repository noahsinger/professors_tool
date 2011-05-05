class GeneralContactsController < ApplicationController
  include ExceptionNotifiable
  
  # GET /general_contacts/new
  # GET /general_contacts/new.xml
  def new
   xxx@xxx.xxx = GeneralContact.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # POST /general_contacts
  # POST /general_contacts.xml
  def create
   xxx@xxx.xxx = GeneralContact.new(params[:general_contact])

    respond_to do |format|
      xxx@xxx.xxx
       xxx@xxx.xxx
        flash[:notice] = 'Contact Email was successfully sent.'
        format.html { redirect_to(:controller => "sections", :action => 'index', :semester_id => Semester.current.id) }
        format.xml  { render :xml => @general_contact, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end
end
