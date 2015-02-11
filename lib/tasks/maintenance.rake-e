desc "Run maintenance tasks"
task :maintenance => :environment do
  Rake::Task["labs:count"].invoke
  Rake::Task["labs:clear"].invoke
  
  puts
  Rake::Task["labs:needs_grading"].invoke
  
  puts
  Rake::Task["examples:count"].invoke
  Rake::Task["examples:clear"].invoke
  Rake::Task["log:clear"].invoke
  
  puts
  Rake::Task["ted_sections:update"].invoke
  
  puts
  Rake::Task["twitter_update:semester"].invoke
end
