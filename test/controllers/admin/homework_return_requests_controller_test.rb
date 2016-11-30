require 'test_helper'

class Admin::HomeworkReturnRequestsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/homework_return_requests', {},
                        {action: 'index'}           => :get,
                        {action: 'show', id: 1}     => :get,
                        {action: 'destroy', id: 1}  => :delete,
                        {action: 'destroy_all'}     => :delete)

  def setup
    login_as(:admin)
  end

  test "should get index" do
    get admin_homework_return_requests_url
    assert_response :success
  end

  test "should show homework return request" do
    get admin_homework_return_request_url(homework_return_requests(:one))
    assert_response :success
  end

  test "should destroy homework return request" do
    assert_difference('HomeworkReturnRequest.count', -1) do
      delete admin_homework_return_request_url(homework_return_requests(:one))
    end

    assert_redirected_to admin_homework_return_requests_path
  end

  test "should destroy_all homework return requests" do
    delete destroy_all_admin_homework_return_requests_url
    assert_equal 0, HomeworkReturnRequest.all.size

    assert_redirected_to admin_homework_return_requests_path
  end
end
