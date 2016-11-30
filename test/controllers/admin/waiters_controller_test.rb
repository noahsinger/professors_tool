require 'test_helper'

class Admin::WaitersControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/waiters', {course_id: 1},
                        {action: 'index'}    => :get,
                        {action: 'show', id: 1}     => :get,
                        {action: 'destroy', id: 1}  => :delete)

  setup do
   xxx@xxx.xxx = waiters(:one)
    login_as(:admin)
  end

  test "should get index" do
    get xxx@xxx.xxx
    assert_response :success
    assert_not_nil assigns(:waiters)
  end

  test "should show waiter" do
    get xxx@xxx.xxx
    assert_response :success
  end

  test "should destroy waiter" do
    assert_difference('Waiter.count', -1) do
      delete xxx@xxx.xxx
    end

    assert_redirected_to xxx@xxx.xxx
  end
end
