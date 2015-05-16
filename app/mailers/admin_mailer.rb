class AdminMailer < ActionMailer::Base
  helper ApplicationHelper

  def general_contact( contact )
   xxx@xxx.xxx = contact

    # Implicit template rendering is not performed if any attachments or parts have been added to the email.
    # This means that you’ll have to manually add each part to the email and set the content type of the email
    # to multipart/alternative.

#     :parts_order => [ "text/plain", "text/enriched", "text/html" ],
# 		:content_type => 'multipart/related',
# 		:content_type => 'multipart/alternative',

		if contact.attachment_file_name
			attachments[contact.attachment_file_name] = {:content => File.read(contact.attachment.to_file.path), :mime_type => contact.attachment_content_type}
		end

		mail( :parts_order => [ "text/plain", "text/enriched", "text/html" ],
					:to => APP_CONFIG['owner_email'],
					:subject => "Contact Request @ #{APP_CONFIG['site_name']}",
					:from => contact.return_email) do |format|
# 		  format.html
		  format.text
		end
    
#     attachments[contact.attachment_file_name] = {:content => File.read(contact.attachment.to_file.path), :mime_type => contact.attachment_content_type} if contact.attachment_file_name
#     mail( :to => APP_CONFIG['owner_email'], :subject => "Contact Request @ #{APP_CONFIG['site_name']}", :from => contact.return_email )
  end
end
