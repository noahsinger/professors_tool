class Admin::MeetingsController < ApplicationController
	before_filter :authenticate
  
  before_filter :load_section
  
  def load_section
   xxx@xxx.xxx = Section.find( params[:section_id] )
  end
  # GET /meetings
  # GET /meetings.json
  def index
    @meetings xxx@xxx.xxx

    respond_to do |format|
      format.html # index.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting xxx@xxx.xxx

    respond_to do |format|
      format.html # show.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    @meeting xxx@xxx.xxx

    respond_to do |format|
      format.html # new.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting xxx@xxx.xxx
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        format.html { redirect_to xxx@xxx.xxx notice: 'Meeting was successfully created.' }
        format.json { render json: @meeting, status: :created, xxx@xxx.xxx }
      else
        format.html { render action: "new" }
        format.json { render xxx@xxx.xxx status: :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting xxx@xxx.xxx

    respond_to do |format|
      xxx@xxx.xxx
        format.html { redirect_to xxx@xxx.xxx notice: 'Meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render xxx@xxx.xxx status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting xxx@xxx.xxx
   xxx@xxx.xxx

    respond_to do |format|
      format.html { redirect_to xxx@xxx.xxx }
      format.json { head :no_content }
    end
  end
end
