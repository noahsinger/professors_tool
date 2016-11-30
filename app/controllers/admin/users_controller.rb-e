class Admin::UsersController < ApplicationController
  before_action :authenticate
  
  # GET /users
  # GET /users.xml
  def index
   xxx@xxx.xxx = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
   xxx@xxx.xxx = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
   xxx@xxx.xxx = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml xxx@xxx.xxx }
    end
  end

  # GET /users/1/edit
  def edit
   xxx@xxx.xxx = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
   xxx@xxx.xxx = User.new(allowed_params)

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'User was successfully created.'
        format.html { xxx@xxx.xxx }
        format.xml  { render :xml => @user, :status => :created, :location xxx@xxx.xxx }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
   xxx@xxx.xxx = User.find(params[:id])

    respond_to do |format|
      xxx@xxx.xxx
        flash[:notice] = 'User was successfully updated.'
        format.html { xxx@xxx.xxx }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml xxx@xxx.xxx :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
   xxx@xxx.xxx = User.find(params[:id])
   xxx@xxx.xxx

    respond_to do |format|
      format.html { redirect_to(admin_users_url) }
      format.xml  { head :ok }
    end
  end
  
  def allowed_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
