require 'test_helper'

class Admin::WaitersControllerTest < ActionController::TestCase
  cannot_access_actions([:id => 1, :course_id => 1],{:index => :get, :show => :get, :destroy => :delete})
  
  setup do
   xxx@xxx.xxx = waiters(:one)
    login_as(:admin)
  end

  test "should get index" do
    get :index, xxx@xxx.xxx
    assert_response :success
    assert_not_nil assigns(:waiters)
  end

  test "should show waiter" do
    get :show, id: @waiter.to_param, xxx@xxx.xxx
    assert_response :success
  end

  test "should destroy waiter" do
    assert_difference('Waiter.count', -1) do
      delete :destroy, id: @waiter.to_param, xxx@xxx.xxx
    end

    assert_redirected_to xxx@xxx.xxx
  end
end
