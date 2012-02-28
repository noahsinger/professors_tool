class Admin::AssignmentTweetsController < ApplicationController
  before_filter :authenticate
  
  def new
   xxx@xxx.xxx = Assignment.find params[:assignment_id]
    
   xxx@xxx.xxx = ""
    if params[:status] == "graded"
      @content = "#{@assignment.title} for #{@assignment.section.meeting_days} #{@assignment.section.course.title} class has been graded. xxx@xxx.xxx
    elsif params[:status] == "new"
      @content = "#{@assignment.title} for #{@assignment.section.meeting_days} #{@assignment.section.course.title} class was just posted. xxx@xxx.xxx
    elsif params[:status] == "duedate"
      @content = "The duedate for #{@assignment.title} of the #{@assignment.section.meeting_days} #{@assignment.section.course.title} class was just changed. xxx@xxx.xxx
    end
  end
  
  def create
   xxx@xxx.xxx = Assignment.find params[:assignment_id]
    begin
      Tweet.new.send( params[:content] )
      flash[:notice] = "Tweet tweeted"
    rescue Twitter::Error => e
      flash[:error] = "Tweet not sent: #{e}"
    end
    
    redirect_to xxx@xxx.xxx @assignment.section, @assignment)
  end
end
