class StudentMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)
  
  def work_submitted( work, submitting_address )
   xxx@xxx.xxx = work
    mail(to: submitting_address, subject: "Homework Submitted @ #{APP_CONFIG['host']}", from: xxx@xxx.xxx
  end

  def work_reminder( work )
   xxx@xxx.xxx = work
    mail( to: work.email, subject: "Homework Reminder @ #{APP_CONFIG['host']}", from: xxx@xxx.xxx )
  end

  def work_return( work, submitting_address )
   xxx@xxx.xxx = work

		if work and work.upload_file_name
      attachments[work.upload_file_name] = File.read(work.upload.path)
		end
    
    mail( to: submitting_address, 
    			subject: "Homework Return @ #{APP_CONFIG['host']}", 
    			from: xxx@xxx.xxx
  end

  def grade_request( enrollment )
   xxx@xxx.xxx = enrollment
    mail( to: enrollment.student.email, subject: "Your Grades @ #{APP_CONFIG['host']}", from: xxx@xxx.xxx )
  end

  def section_email( section, address, text )
   xxx@xxx.xxx = text
   xxx@xxx.xxx = section
    mail( to: address, subject: "Section Annoucement from #{APP_CONFIG['host']}", from: xxx@xxx.xxx )
  end
  
  def section_availability_notification(section, email)
   xxx@xxx.xxx = section
    mail( to: email, subject: "A new section of #{section.course.title} has been added to the schedule", from: xxx@xxx.xxx )
  end
end
