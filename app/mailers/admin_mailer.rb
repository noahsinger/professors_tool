class AdminMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)
  
  def general_contact( contact )
   xxx@xxx.xxx = contact

		if contact.attachment_file_name
      attachments[contact.attachment_file_name] = File.read(contact.attachment.path)
		end

		mail( to: APP_CONFIG['owner_email'],
					subject: "Contact Request @ #{APP_CONFIG['host']}",
					from: contact.return_email)
  end
end
