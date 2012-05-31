# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ingenious::Application.initialize!

# if in 1.8, load FasterCSV, if in 1.9 FasterCSV is the default
require 'csv'
if CSV.const_defined? :Reader
  # Ruby 1.8 compatible
  require 'fastercsv'
  Object.send(:remove_const, :CSV)
  CSV = FasterCSV
else
  # CSV is now FasterCSV in ruby 1.9
end
