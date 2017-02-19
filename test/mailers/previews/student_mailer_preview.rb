# Preview all emails at http://localhost:3000/rails/mailers/student_mailer
class StudentMailerPreview < ActionMailer::Preview
  def grade_request
    enrollment = Enrollment.first
    StudentMailer.grade_request(enrollment)
  end
  
  def section_availability_notification
    section = Section.first
    email = "victrola_firecracker@woodpecker.com"
    StudentMailer.section_availability_notification(section, email)
  end
  
  def section_email
    section = Section.first
    address = "victrola_firecracker@woodpecker.com"

text = <<ENDEMAILBODYHERE
Hello Everyone,

I am sending you this quick email to let you know about important things.

Those important things include:
* this
* and this
* and this

See ya!
ENDEMAILBODYHERE

    StudentMailer.section_email(section, address, text)
  end
  
  def work_reminder
    work = Work.first
    StudentMailer.work_reminder(work)
  end
  
  def work_return
    work = Work.first
    submitting_address = work.enrollment.student.email
    StudentMailer.work_return(work, submitting_address)
  end
  
  def work_submitted
    work = Work.first
    submitting_address = work.enrollment.student.email
    
    StudentMailer.work_submitted(work, submitting_address)
  end
end
