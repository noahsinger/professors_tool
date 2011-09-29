require 'test_helper'

class Admin::HomeworkReturnRequestsControllerTest < ActionController::TestCase
  cannot_access_actions([:id => 1],{:index => :get, :show => :get, :destroy => :delete, :destroy_all => :delete})
  
  def setup
    login_as(:admin)
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should show homework return request" do
    get :show, :id => homework_return_requests(:one)
    assert_response :success
  end
  
  test "should destroy homework return request" do
    assert_difference('HomeworkReturnRequest.count', -1) do
      delete :destroy, :id => homework_return_requests(:one)
    end
  
    assert_redirected_to admin_homework_return_requests_path
  end
  
  test "should destroy_all homework return requests" do
    delete :destroy_all
    assert_equal 0, HomeworkReturnRequest.all.size
  
    assert_redirected_to admin_homework_return_requests_path
  end
end
