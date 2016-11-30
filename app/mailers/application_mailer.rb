class ApplicationMailer < ActionMailer::Base
  default from: APP_CONFIG['owner_email']
  layout 'mailer'
end
