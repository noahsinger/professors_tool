namespace :sections do
  desc "notify course waiters"
  task :notify_waiters => :environment do
    count = 0
    
    Semester.last.sections.each do |section|
	    count += section.course.waiters.count
      section.notify_waiters
    end
    
    puts "#{count} waiters notified"
  end
end
