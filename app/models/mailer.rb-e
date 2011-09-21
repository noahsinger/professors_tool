class Mailer < ActionMailer::Base
  
  def general_contact( contact )
    recipients        APP_CONFIG['owner_email']
    subject           'Contact Request @ Ingenio.us'
    from              contact.return_email
    body              :contact => contact

    part :content_type => "multipart/alternative" do |p|
      p.part :content_type => "text/html", :body => render_message("general_contact.text.html.erb", :contact => contact)
    end
    
    # Attachments
    if contact.attachment_file_name
      logger.info "***Appending Attachment"
      attachment "application/octet-stream" do |a|
          a.body = File.read(contact.attachment.to_file.path)
          a.filename = contact.attachment_file_name
      end
    end
  end

  def work_submitted( work, submitting_address )
    recipients        submitting_address
    subject           'Homework Submitted @ Ingenio.us.com'
    # from              'Ingenio.us Homework Ingestor xxx@xxx.xxx
    from              xxx@xxx.xxx
    body              :work => work
  end

  def work_reminder( work )
    recipients        work.email
    subject           'Homework Reminder @ Ingenio.us.com'
    # from              'Ingenio.us Homework Ingestor xxx@xxx.xxx
    from              xxx@xxx.xxx
    body              :work => work
  end

  def work_return( work, submitting_address )
    recipients        submitting_address
    subject           'Homework Return @ Ingenio.us.com'
    # from              'Ingenio.us Homework Regurgitator xxx@xxx.xxx
    from              xxx@xxx.xxx
    body              :work => work
    
    if work and work.upload_file_name
      attachment :content_type => work.upload_content_type, :body => File.read(work.upload.path), :filename => work.upload_file_name
    end
  end

  def grade_request( enrollment )
    recipients        enrollment.student.email
    subject           'Your Grades @ Ingenio.us.com'
    # from              'Ingenio.us Grades Regurgitator xxx@xxx.xxx
    from              xxx@xxx.xxx
    body              :enrollment => enrollment
  end

  def section_email( section, address, text )
    recipients        address
    subject           'Section Annoucement from Ingenio.us.com'
    from              xxx@xxx.xxx
    body              :text => text, :section => section
  end  
end
