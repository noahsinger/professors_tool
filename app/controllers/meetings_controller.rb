class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
   xxx@xxx.xxx = Meeting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
   xxx@xxx.xxx = Meeting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
   xxx@xxx.xxx = Meeting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render xxx@xxx.xxx }
    end
  end

  # GET /meetings/1/edit
  def edit
   xxx@xxx.xxx = Meeting.find(params[:id])
  end

  # POST /meetings
  # POST /meetings.json
  def create
   xxx@xxx.xxx = Meeting.new(params[:meeting])

    respond_to do |format|
      xxx@xxx.xxx
        format.html { xxx@xxx.xxx notice: 'Meeting was successfully created.' }
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
   xxx@xxx.xxx = Meeting.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        format.html { xxx@xxx.xxx notice: 'Meeting was successfully updated.' }
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
   xxx@xxx.xxx = Meeting.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :no_content }
    end
  end
end
