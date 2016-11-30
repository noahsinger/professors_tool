# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  def general_contact
#     gc = GeneralContact.create return_email: xxx@xxx.xxx
#                                subject: "test",
#                                attachment: File.open('test/fixtures/files/file.zip','r'),
#                                body: <<END_HERE
# Professor Singer?
#
# Can you please help me with a problem?
# I don't know what's wrong or how to fix it!
#
# END_HERE

    gc = GeneralContact.first
    AdminMailer.general_contact( gc )
  end
end
