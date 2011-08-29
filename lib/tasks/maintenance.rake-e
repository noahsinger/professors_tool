desc "Run maintenance tasks"
task :maintenance => :environment do
  Rake::Task["labs:count"].invoke
  Rake::Task["labs:clear"].invoke
  Rake::Task["examples:count"].invoke
  Rake::Task["examples:clear"].invoke
  Rake::Task["log:clear"].invoke
end
