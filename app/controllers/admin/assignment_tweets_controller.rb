class Admin::AssignmentTweetsController < ApplicationController
  before_action :authenticate

  def new
    @assignment = Assignment.find params[:assignment_id]

    @content = "#{@assignment.title} for"

    unless @assignment.section.days.empty?
	  	@content = "#{@content} #{@assignment.section.short_days}"
	  end

	  @content = "#{@content} #{@assignment.section.course.title}"

    if params[:status] == "graded"
	    @content = "#{@content} class has been graded. #{@assignment.short_url}"
    elsif params[:status] == "new"
    	@content = "#{@content} class is now available. #{@assignment.short_url}"
    elsif params[:status] == "duedate"
    	@content = "#{@content} class has had its due date changed. #{@assignment.short_url}"
    end
  end

  def create
    respond_to do |format|
      @assignment = Assignment.find params[:assignment_id]
      begin
        Tweet.new.send( params[:content] )
        flash[:notice] = "Tweet tweeted"
      rescue Twitter::Error => e
        flash[:error] = "Tweet not sent: #{e}"
      end

      @status = admin_semester_section_assignment_path(@assignment.section.semester, @assignment.section, @assignment)
      format.html {redirect_to admin_semester_section_assignment_path(@assignment.section.semester, @assignment.section, @assignment)}
      format.js
    end
  end
end
