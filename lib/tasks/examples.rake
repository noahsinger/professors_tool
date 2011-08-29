namespace :examples do
  desc "Count examples on the site"
  task :count => :environment do
    count = 0
    
    semesters = Semester.all
    semesters.each do |semester|
      semester.sections.each do |section|
        section.examples.each do |example|
          count += 1
        end
      end
    end
    
    puts "#{count} examples currently on the website"
  end
  
  desc "Clear examples > 1 year old"
  task :clear => :environment do
    semesters = Semester.all
    current = Semester.current
    semesters.each do |semester|
      if semester.end_date + 1.year < current.end_date
        semester.sections.each do |section|
          section.examples.each do |example|
            example.destroy
          end
        end
      end
    end
  end
end
