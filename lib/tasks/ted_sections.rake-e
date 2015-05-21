namespace :ted_sections do

  desc "Update sections from TED"
  task :update => :environment do
   	Semester.current.import_sections_from_ted if Semester.current
    
    Semester.all.each do |semester|
    	semester.import_sections_from_ted if semester.is_future
    end
  end
  
end
