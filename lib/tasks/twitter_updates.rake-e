require 'tweet'
include ActionView::Helpers::DateHelper # for time_ago_in_words

namespace :twitter_update do
  # run this from cron at about a 2 hour interval
  desc "Tweet labs that are coming due"
  task :labs_due => :environment do
    current = Semester.current
    current.sections.all.each do |section|
      section.assignments.each do |assignment|
        if (assignment.duedate) > Time.now and (assignment.duedate - 12.hours) < Time.now
          puts "#{assignment.title} for #{assignment.section.short_days} #{assignment.section.course.title} is due in #{time_ago_in_words(assignment.duedate)}" 
          Tweet.new.send "#{assignment.title} for #{assignment.section.short_days} #{assignment.section.course.title} is due in #{time_ago_in_words(assignment.duedate)}" 
        end
      end
    end
  end

  # run in cron at about a 1 day interval
  desc "Tweet semester starts and ends"
  task :semester => :environment do
    Semester.all.each do |semester|
      # semesters that haven't started yet
      if semester.start_date > Time.now.to_date and (semester.start_date - 7.days) < Time.now.to_date
        puts "The #{semester.name} semester starts in #{time_ago_in_words(semester.start_date)}"
        Tweet.new.send "The #{semester.name} semester starts in #{time_ago_in_words(semester.start_date)}"
      # current semester
      elsif semester.start_date < Time.now.to_date and semester.end_date > Time.now.to_date
        puts "#{time_ago_in_words(semester.end_date)} to the end of the #{semester.name} semester"
        Tweet.new.send "#{time_ago_in_words(semester.end_date)} to the end of the #{semester.name} semester"
      end
    end
  end
  
end
