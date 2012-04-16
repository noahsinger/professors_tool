class AdminMailer < ActionMailer::Base
  helper ApplicationHelper
  
  def general_contact( contact )
   xxx@xxx.xxx = contact
    
    attachments[contact.attachment_file_name] = File.read(contact.attachment.to_file.path) if contact.attachment_file_name
    
    mail( :to => APP_CONFIG['owner_email'], :subject => 'Contact Request @ Ingenio.us', :from => contact.return_email )
  end
end
