class Admin::DivisionsController < ApplicationController
  before_action :authenticate
  
  # GET /divisions
  # GET /divisions.xml
  def index
    @divisions = Division.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @divisions }
    end
  end

  # GET /divisions/new
  # GET /divisions/new.xml
  def new
    @division = Division.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @division }
    end
  end

  # GET /divisions/1/edit
  def edit
    @division = Division.find(params[:id])
  end

  # POST /divisions
  # POST /divisions.xml
  def create
    @division = Division.new(allowed_params)

    respond_to do |format|
      if @division.save
        @status = admin_divisions_url
        flash[:notice] = 'Division was successfully created.'
        format.html { redirect_to(admin_divisions_url) }
        format.xml  { render xml: @division, status: :created, location: @division }
      else
        @status = "failed"
        format.html { render action: "new" }
        format.xml  { render xml: @division.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /divisions/1
  # PUT /divisions/1.xml
  def update
    @division = Division.find(params[:id])

    respond_to do |format|
      if @division.update_attributes(allowed_params)
        @status = admin_divisions_url
        flash[:notice] = 'Division was successfully updated.'
        format.html { redirect_to(admin_divisions_url) }
        format.xml  { head :ok }
      else
        @status = "failed"
        format.html { render action: "edit" }
        format.xml  { render xml: @division.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /divisions/1
  # DELETE /divisions/1.xml
  def destroy
    @division = Division.find(params[:id])
    @division.destroy

    respond_to do |format|
      @status = admin_divisions_url
      format.html { redirect_to(admin_divisions_url) }
      format.xml  { head :ok }
      format.js
    end
  end

  def allowed_params
    params.require(:division).permit(:name, :phone_number, :office_number, :associate_dean)
  end 
end
