class GeneralContactsController < ApplicationController
  # GET /general_contacts/new
  # GET /general_contacts/new.xml
  def new
    if params[:section_id]
     xxx@xxx.xxx = Section.find params[:section_id]
    end

   xxx@xxx.xxx = GeneralContact.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # POST /general_contacts
  # POST /general_contacts.xml
  def create
   xxx@xxx.xxx = GeneralContact.new(allowed_params)
    
    if params[:section_id]
     xxx@xxx.xxx = Section.find params[:section_id]
    end

    respond_to do |format|
      xxx@xxx.xxx
       xxx@xxx.xxx
        flash[:notice] = 'Contact Email was successfully sent.'
        
        xxx@xxx.xxx
          format.html { redirect_to( xxx@xxx.xxx ) }
        else
          format.html { redirect_to( root_url ) }
        end
        
        format.xml  { render :xml => @general_contact, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  def allowed_params
    params.require(:general_contact).permit(:return_email, :subject, :body, :attachment)
  end
end
