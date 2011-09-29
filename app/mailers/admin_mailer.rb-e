class AdminMailer < ActionMailer::Base
  # default :from => xxx@xxx.xxx
  
  def general_contact( contact )
   xxx@xxx.xxx = contact
    
    if contact.attachment_file_name
      attachments[contact.attachment_file_name] = File.read(contact.attachment.to_file.path)
    end
    
    mail( :to => APP_CONFIG['owner_email'], :subject => 'Contact Request @ Ingenio.us', :from => contact.return_email )
  end
end
