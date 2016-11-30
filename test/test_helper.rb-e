ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'capybara/rails'
require 'mocha/mini_test'

class ActiveSupport::TestCase

  class ActionDispatch::IntegrationTest
    include Capybara::DSL
    self.class.include Rails.application.routes.url_helpers
    default_url_options[:host] = "localhost"
  end

  Capybara.javascript_driver = :webkit

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_as(user)
    User.create(username: 'user', password: 'test', password_confirmation: 'test')
    post sessions_url, params: {username: 'user', password: 'test'}
  end

  def logout
    delete session_url(0) # id isn't used so it doesn't matter
  end

  def self.cannot_access_actions(controller, require_params, actions)
    actions.each do |action_url_parts, method|

      action_url_parts.merge! require_params
      action_url_parts[:controller] = controller
      action_url = url_for(action_url_parts)

      define_method("test_cannot_access_#{action_url_parts[:controller].gsub('/','_')}_#{action_url_parts[:action]}") do
        # logout

        send(method, action_url)

        assert_response :redirect
        assert_redirected_to login_path
      end
    end
  end
end
