source 'http://rubygems.org'

gem 'rails', '3.2.12'

gem 'icalendar', '~> 1.1'
gem 'RedCloth', '~> 4.2'
gem 'delayed_job', '~> 3.0'
gem 'delayed_job_active_record', '~> 0.3'
gem 'paperclip', '~> 2.7'
gem 'redcarpet', '~> 2.1'
gem 'twitter', '~> 4.8'
# gem 'twitter', '~> 5.0'
# gem 'system_timer', '~> 1.2'
gem 'shortly', '~> 0.3'
gem 'bcrypt-ruby', '~> 3.0'
gem 'mechanize' #, '~> 2.3'
gem 'coderay', '~> 1.0'
gem 'premailer-rails3', '~> 1.1'
# gem 'nokogiri', '~> 1.5' #required by premailer-rails3
gem 'thin'

gem 'fastercsv', '~> 1.5', :platforms => :mri_18

gem 'remotipart', '~> 1.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier', '>= 1.0'
end

gem 'jquery-rails', '~> 2.0'
gem 'turbolinks', '~> 0.6'

group :production do
	gem 'mysql'
	gem 'mysql2'
	# gem 'therubyracer'
end

group :development do
  gem 'sqlite3'
  gem 'letter_opener'
  gem 'hirb'
  gem 'awesome_print'
  gem 'quiet_assets'
end

group :development, :test do	
  gem 'mocha', '~>0.10.4'
  gem 'capybara', '~> 1.1'
  gem 'turn', :require => false
  gem 'minitest' #required by turn
  gem 'faker', '~> 1.1'
  gem "libv8" #, "~> 3.11.8.3"
	gem "therubyracer" #, "~> 0.11.0beta7"
  
  # gem 'guard-minitest', '> 0.3.0' #less than 0.3.0 gives file not found errors with rails3.1
  # gem 'guard-minitest', :git => 'git://github.com/aspiers/guard-minitest.git' #alt repo got growl notifications working
  # gem 'growl'        # for guard-minitest
  # gem 'rb-fsevent'  # for guard-minitest
  # gem 'ruby-prof'    # for guard-minitest
end

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'
