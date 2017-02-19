class StudentMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)
  
  def work_submitted( work, submitting_address )
    @work = work
    mail(to: submitting_address, subject: "Homework Submitted @ #{APP_CONFIG['host']}", from: "homeworkingestor@#{APP_CONFIG['host']}")
  end

  def work_reminder( work )
    @work = work
    mail( to: work.email, subject: "Homework Reminder @ #{APP_CONFIG['host']}", from: "homeworkingestor@#{APP_CONFIG['host']}" )
  end

  def work_return( work, submitting_address )
    @work = work

		if work and work.upload_file_name
      attachments[work.upload_file_name] = File.read(work.upload.path)
		end
    
    mail( to: submitting_address, 
    			subject: "Homework Return @ #{APP_CONFIG['host']}", 
    			from: "homeworkregurgitator@#{APP_CONFIG['host']}")
  end

  def grade_request( enrollment )
    @enrollment = enrollment
    mail( to: enrollment.student.email, subject: "Your Grades @ #{APP_CONFIG['host']}", from: "gradesregurgitator@#{APP_CONFIG['host']}" )
  end

  def section_email( section, address, text )
    @text = text
    @section = section
    mail( to: address, subject: "Section Annoucement from #{APP_CONFIG['host']}", from: "noreply@#{APP_CONFIG['host']}" )
  end
  
  def section_availability_notification(section, email)
    @section = section
    mail( to: email, subject: "A new section of #{section.course.title} has been added to the schedule", from: "noreply@#{APP_CONFIG['host']}" )
  end
end
