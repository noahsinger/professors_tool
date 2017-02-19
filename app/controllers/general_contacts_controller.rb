class GeneralContactsController < ApplicationController
  # GET /general_contacts/new
  # GET /general_contacts/new.xml
  def new
    if params[:section_id]
      @section = Section.find params[:section_id]
    end

    @general_contact = GeneralContact.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @general_contact }
    end
  end

  # POST /general_contacts
  # POST /general_contacts.xml
  def create
    @general_contact = GeneralContact.new(allowed_params)
    
    if params[:section_id]
      @section = Section.find params[:section_id]
    end

    respond_to do |format|
      if @general_contact.save
        @general_contact.send_email
        flash[:notice] = 'Contact Email was successfully sent.'
        
        if @section
          @status = semester_section_assignments_url(@section.semester,@section)
          format.html { redirect_to( semester_section_assignments_url(@section.semester,@section) ) }
        else
          @status = root_url
          format.html { redirect_to( root_url ) }
        end
        
        format.js
        format.xml  { render xml: @general_contact, status: :created, location: @general_contact }
      else
        @status = "failed"
        format.js
        format.html { render action: "new" }
        format.xml  { render xml: @general_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def allowed_params
    params.require(:general_contact).permit(:return_email, :subject, :body, :attachment)
  end
end
