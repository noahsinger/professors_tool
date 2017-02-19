class SessionsController < ApplicationController
  def new
  end

  def create
    respond_to do |format|
      user = User.find_by_username(params[:username])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        @status = admin_admin_index_url
        format.html {redirect_to admin_admin_index_url, notice: "Logged in!"}
      else
        @status = new_session_url #redirect back to this page, don't just render, so that flash can be shown
        flash[:error] = "Invalid email or password"
        format.html {render "new"}
      end
      
      format.js
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
