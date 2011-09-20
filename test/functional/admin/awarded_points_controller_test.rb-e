require 'test_helper'

# This controller is only used programmatically.  While views for it exist they are not currently 
# accessible through any link.

class Admin::AwardedPointsControllerTest < ActionController::TestCase
	def test_cannot_access_actions_when_not_loggedin
		actions = {:index => :get, :new => :get, :create => :post, :edit => :get, :update => :post, :destroy => :delete}
		actions.each do |action, request|
			send( request, action )
			assert_response :redirect
	    assert_redirected_to signin_admin_admin_path
		end
	end
end
