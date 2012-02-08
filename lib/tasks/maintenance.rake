desc "Run maintenance tasks"
task :maintenance => :environment do
  puts "lab stats ---------------------------"
  Rake::Task["labs:count"].invoke
  Rake::Task["labs:clear"].invoke
  
  puts
  puts "grading   ---------------------------"
  Rake::Task["labs:needs_grading"].invoke
  
  puts
  puts "examples stats ----------------------"
  Rake::Task["examples:count"].invoke
  Rake::Task["examples:clear"].invoke
  Rake::Task["log:clear"].invoke
end
