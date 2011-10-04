ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'capybara/rails'

class ActiveSupport::TestCase
  
  class ActionDispatch::IntegrationTest
    include Capybara::DSL
  end
  
  Capybara.javascript_driver = :webkit
  
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_as(user)
   xxx@xxx.xxx = user ? users(user).id : nil
  end
  
  def logout
   xxx@xxx.xxx = nil
  end
  
  def self.cannot_access_actions(route_parts = [:id => 1], actions = {:index => :get, :show => :get, :new => :get, :create => :post, :edit => :get, :update => :put, :destroy => :delete})
    actions.each do |action, request|
      define_method("test_cannot_access_#{action}") do
        logout
        
        if ["index","new","create"].index( action )
          assert_routing({:path => "/#{@controller.controller_path}/#{action}", :method => request},{:controller xxx@xxx.xxx :action => action })
        elsif ["show","edit","update","destroy"].index( action )
          assert_routing({:path => "/#{@controller.controller_path}/1/#{action}", :method => request},{:controller xxx@xxx.xxx :action => action, :id => 1 })
        end
        
        send( request, action, *route_parts )
        assert_response :redirect
        assert_redirected_to signin_admin_admin_index_path    
      end
    end
  end
end
