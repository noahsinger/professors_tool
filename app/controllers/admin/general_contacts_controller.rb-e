class Admin::GeneralContactsController < ApplicationController
  before_filter :authenticate
  
  def download
    general_contact = GeneralContact.find( params[:id] )
    
    # TODO: try changing this to x_send_file which will use the x_send_file plugin which has the potential to
    # to send the file much more efficiently than send_file does.  Didn't work in development through mongrel
    # but might work when it's running through apache.
    send_file( general_contact.attachment.path, 
                :type => general_contact.attachment_content_type, 
                :disposition => 'inline', 
                :filename => general_contact.attachment_file_name )
  end
  
  # GET /general_contacts
  # GET /general_contacts.xml
  def index
   xxx@xxx.xxx = GeneralContact.find(:all, :order => 'created_at desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /general_contacts/1
  # GET /general_contacts/1.xml
  def show
   xxx@xxx.xxx = GeneralContact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /general_contacts/new
  # GET /general_contacts/new.xml
  def new
   xxx@xxx.xxx = GeneralContact.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /general_contacts/1/edit
  def edit
   xxx@xxx.xxx = GeneralContact.find(params[:id])
  end

  # POST /general_contacts
  # POST /general_contacts.xml
  def create
   xxx@xxx.xxx = GeneralContact.new(params[:general_contact])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'GeneralContact was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @general_contact, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /general_contacts/1
  # PUT /general_contacts/1.xml
  def update
   xxx@xxx.xxx = GeneralContact.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'GeneralContact was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /general_contacts/1
  # DELETE /general_contacts/1.xml
  def destroy
   xxx@xxx.xxx = GeneralContact.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { redirect_to(admin_general_contacts_url) }
      format.xml  { head :ok }
    end
  end
  
  def destroy_all
    contacts = GeneralContact.find( :all )
    contacts.each do |c|
      c.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to(admin_general_contacts_url) }
      format.xml  { head :ok }
    end
  end
end
