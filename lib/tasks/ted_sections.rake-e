namespace :ted_sections do

  desc "Update sections from TED"
  task :update => :environment do
    current = Semester.current
    current.import_sections_from_ted
  end
  
end
