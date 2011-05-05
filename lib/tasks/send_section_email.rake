begin
  require 'delayed/tasks'
rescue LoadError
  STDERR.puts "Run `rake gems:install` to install delayed_job"
end

desc "Send section email"
task :send_section_email => :environment do
  section = Section.find(ENV["SECTION_ID"])
  body = ENV["BODY"]
  section.send_email body
end
