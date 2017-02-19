require 'test_helper'

class Admin::WaitersControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/waiters', {course_id: 1},
                        {action: 'index'}    => :get,
                        {action: 'destroy', id: 1}  => :delete)

  setup do
    @waiter = waiters(:one)
    login_as(:admin)
  end

  test "should get index" do
    get admin_course_waiters_url(@waiter.course)
    assert_response :success
    assert_not_nil assigns(:waiters)
  end

  test "should destroy waiter" do
    assert_difference('Waiter.count', -1) do
      delete admin_course_waiter_url(@waiter.course,@waiter)
    end

    assert_redirected_to admin_course_waiters_path(@waiter.course)
  end
end
