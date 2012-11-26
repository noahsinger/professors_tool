namespace :ted_students do

  desc "Sync students with TED"
  task :sync => :environment do
    Semester.current.sections.each do |section|
    	section.sync_students_with_ted
    end
  end
  
end
