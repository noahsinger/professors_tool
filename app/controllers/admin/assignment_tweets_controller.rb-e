class Admin::AssignmentTweetsController < ApplicationController
  before_action :authenticate

  def new
   xxx@xxx.xxx = Assignment.find params[:assignment_id]

    @content = xxx@xxx.xxx for"

    xxx@xxx.xxx
	  	@content = "#{@content} xxx@xxx.xxx
	  end

	  @content = "#{@content} xxx@xxx.xxx

    if params[:status] == "graded"
	    @content = "#{@content} class has been graded. xxx@xxx.xxx
    elsif params[:status] == "new"
    	@content = "#{@content} class is now available. xxx@xxx.xxx
    elsif params[:status] == "duedate"
    	@content = "#{@content} class has had its due date changed. xxx@xxx.xxx
    end
  end

  def create
    respond_to do |format|
     xxx@xxx.xxx = Assignment.find params[:assignment_id]
      begin
        Tweet.new.send( params[:content] )
        flash[:notice] = "Tweet tweeted"
      rescue Twitter::Error => e
        flash[:error] = "Tweet not sent: #{e}"
      end

      @status = xxx@xxx.xxx @assignment.section, @assignment)
      format.html {redirect_to xxx@xxx.xxx @assignment.section, @assignment)}
      format.js
    end
  end
end
