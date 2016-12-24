require 'test_helper'

class Admin::GradeRequestsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/grade_requests', {},
                        {action: 'index'}           => :get,
                        {action: 'destroy', id: 1}  => :delete,
                        {action: 'destroy_all'}     => :delete)

  def setup
    login_as(:admin)
  end

  test "should get index" do
    get admin_grade_requests_url
    assert_response :success
  end

  test "should destroy grade request" do
    assert_difference('GradeRequest.count', -1) do
      delete admin_grade_request_url(grade_requests(:one))
    end

    assert_redirected_to admin_grade_requests_path
  end

  test "should destroy_all grade requests" do
    delete destroy_all_admin_grade_requests_url
    assert_equal 0, GradeRequest.all.size

    assert_redirected_to admin_grade_requests_path
  end
end
