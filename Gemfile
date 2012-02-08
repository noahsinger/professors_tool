source 'http://rubygems.org'

gem 'rails', '3.2.1'

gem 'sqlite3'

gem "icalendar"
gem "RedCloth"
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'paperclip'
gem 'redcarpet'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   "~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', ">=1.0.3"
end

gem 'jquery-rails'

gem "letter_opener", :group => :development

group :development, :test do	
	gem 'capybara'
  gem 'turn', :require => false
  gem 'minitest' #required by turn
  
	gem 'guard-minitest', "> 0.3.0" #less than 0.3.0 gives file not found errors with rails3.1
  
  # gem 'growl'        # for guard-minitest
  gem 'growl_notify' # growl notifications of all types seem to be broken
  
  gem 'rb-fsevent'  # for guard-minitest
  gem 'ruby-prof'    # for guard-minitest
end

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'
