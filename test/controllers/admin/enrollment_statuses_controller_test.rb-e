require 'test_helper'

class Admin::EnrollmentStatusesControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/enrollment_statuses', {},
                        {action: 'index'}    => :get,
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
  end

  test "should_get_index" do
    get admin_enrollment_statuses_url
    assert_response :success
  end

  test "should_get_new" do
    get new_admin_enrollment_status_url
    assert_response :success
  end

  test "should_create_enrollment_status" do
    assert_difference('EnrollmentStatus.count') do
      post admin_enrollment_statuses_url,
      params: {
        enrollment_status: {
          name: 'Withdrawn'
        }
      }
    end

    assert_redirected_to admin_enrollment_statuses_path
  end

  test "should_get_edit" do
    get edit_admin_enrollment_status_url(enrollment_statuses(:enrolled))
    assert_response :success
  end

  test "should_update_enrollment_status" do
    put admin_enrollment_status_url(enrollment_statuses(:enrolled)), params: {enrollment_status: { name: 'new name' }}
    assert_redirected_to admin_enrollment_statuses_path
  end

  test "should_destroy_enrollment_status" do
    assert_difference('EnrollmentStatus.count', -1) do
      delete admin_enrollment_status_url(enrollment_statuses(:enrolled))
    end

    assert_redirected_to admin_enrollment_statuses_path
  end
end
