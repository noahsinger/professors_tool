source 'http://rubygems.org'

gem 'rails', '3.2.2'

gem 'sqlite3'

gem "icalendar"
gem "RedCloth"
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'paperclip'
gem 'redcarpet'
gem 'twitter', "~> 2.1.0"
gem 'shortly', "~> 0.3.3"
gem 'bcrypt-ruby', "~> 3.0.1"
gem 'mechanize', '~>2.3'
gem "coderay", "~> 1.0"
# gem 'roadie', '~> 2.3'
gem 'premailer-rails3'
gem 'nokogiri' #required by premailer-rails3

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   "~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', ">=1.0.3"
end

gem 'jquery-rails'

group :development do
	gem "letter_opener"
	gem "hirb"
	gem "awesome_print"
	gem 'quiet_assets'
end

group :development, :test do	
	gem 'mocha', "~>0.10.4"
	gem 'capybara'
  gem 'turn', :require => false
  gem 'minitest' #required by turn
  
  # gem 'guard-minitest', "> 0.3.0" #less than 0.3.0 gives file not found errors with rails3.1
  gem 'guard-minitest', :git => 'git://github.com/aspiers/guard-minitest.git' #alt repo got growl notifications working
  
  gem 'growl'        # for guard-minitest
  
  gem 'rb-fsevent'  # for guard-minitest
  gem 'ruby-prof'    # for guard-minitest
end

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'
