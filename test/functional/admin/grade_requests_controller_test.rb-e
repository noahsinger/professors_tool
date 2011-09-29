require 'test_helper'

class Admin::GradeRequestsControllerTest < ActionController::TestCase
  cannot_access_actions([:id => 1], {:index => :get, :show => :get, :destroy => :delete, :destroy_all => :delete})
  
  def setup
    login_as(:admin)
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should show grade request" do
    get :show, :id => grade_requests(:one)
    assert_response :success
  end
  
  test "should destroy grade request" do
    assert_difference('GradeRequest.count', -1) do
      delete :destroy, :id => grade_requests(:one)
    end
  
    assert_redirected_to admin_grade_requests_path
  end
  
  test "should destroy_all grade requests" do
    delete :destroy_all
    assert_equal 0, GradeRequest.all.size
  
    assert_redirected_to admin_grade_requests_path
  end
end
