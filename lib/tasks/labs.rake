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
    Section.all.each do |section|
      if section.end_date + 2.year < current.end_date
        section.assignments.each do |assignment|
          assignment.works.each do |work|
            unless work.upload_content_type == "removed"
              work.upload = nil
              work.upload_content_type = "removed"
              work.save(false)
              
              student_name = if work.enrollment
                work.enrollment.student.last_name_first
              else
                "Unknown"
              end
              
              course_name = if work.enrollment
                work.enrollment.section.course.title
              else
                "Unknown"
              end
              
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
            puts "Ungraded work - #{work.assignment.section.meeting_days} #{work.assignment.section.course.title} (#{work.assignment.section.semester.short_name}) - #{work.enrollment.student.last_name_first}"
          else
            puts "Ungraded work - #{work.assignment.section.meeting_days} #{work.assignment.section.course.title} (#{work.assignment.section.semester.short_name}) - Unknown Student"
          end
        end
      end
    end
  end
end
