namespace :labs do
  desc "Count all labs"
  task :count => :environment do
    count = 0
    Work.all.each do |work|
      count += 1 unless work.upload_file_name == nil
    end
    puts "#{count} labs stored on the site"
  end
  
  desc "Clear labs > 2 year old"
  task :clear => :environment do
    current = Semester.current
    # puts "	current semester retreived"
    Section.all.each do |section|
      # puts "	iterating through sections"
      if section.end_date + 2.year < current.end_date
      	# puts "	section found more than 2 years old"
        section.assignments.each do |assignment|
          # puts "	iterating through assignments"
          assignment.works.each do |work|
          	# puts "	iterating through works"
            unless work.upload_content_type == "removed"
              # puts "	setting work to be removed"
              work.upload = nil
              work.upload_content_type = "removed"
              # puts "	saving work"
              work.save(:validate => false)
              # puts "	work saved"
              
              # puts "	finding students name"
              student_name = if work.enrollment
                work.enrollment.student.last_name_first
              else
                "Unknown"
              end
              
              # puts "	finding course name"
              course_name = if work.enrollment
                work.enrollment.section.course.title
              else
                "Unknown"
              end
              
              # puts "	finding semester name"
              semester_name = if work.enrollment
                work.enrollment.section.semester.name
              else
                "Unknown"
              end
              
              puts "#{work.upload_file_name} uploaded by #{student_name} was removed (#{course_name}, #{semester_name})"
            end
          end
        end
      end
    end
  end
  
  desc "labs in need of some grading"
  task :needs_grading => :environment do
    Work.all.each do |work|
      unless work.graded?
        if work.assignment.section.semester == Semester.current
          if work.enrollment
            puts "Ungraded work - #{work.assignment.section.meeting_days} #{work.assignment.section.course.title} #{work.assignment.title} (#{work.assignment.section.semester.short_name}) - #{work.enrollment.student.last_name_first}"
          else
            puts "Ungraded work - #{work.assignment.section.meeting_days} #{work.assignment.section.course.title} #{work.assignment.title} (#{work.assignment.section.semester.short_name}) - Unknown Student"
          end
        end
      end
    end
  end
end
