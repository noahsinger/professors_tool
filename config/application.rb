require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProfessorsTool
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

# deprecation warning said to put this here
Rails.application.config.active_record.time_zone_aware_types = [:datetime, :time]

# autoload classes in the lib folder
Rails.application.config.autoload_paths << "#{Rails.root}/lib"
