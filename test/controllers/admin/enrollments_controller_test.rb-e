require 'test_helper'

class Admin::EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/enrollments', {semester_id: 1, section_id: 1},
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'show', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
  end

  test "should_get_show" do
    get admin_semester_section_enrollment_url(semesters(:spring),sections(:jck1003_section_1),enrollments(:stews_enrollment))
    assert_response :success
  end

  test "should_get_new" do
    get new_admin_semester_section_enrollment_url(semesters(:spring),sections(:jck1003_section_1))
    assert_response :success
  end

  test "should_create_enrollment" do
    assert_difference('Enrollment.count') do
      post admin_semester_section_enrollments_url(semesters(:spring),sections(:jck1003_section_1)),
        params: {email: students(:stew).email}
    end

    assert_redirected_to admin_semester_section_path( semesters(:spring), sections(:jck1003_section_1) )
  end

  test "should_update_enrollment" do
    put admin_semester_section_enrollment_url(semesters(:spring),sections(:jck1003_section_1),enrollments(:stews_enrollment)),
      params: {enrollment: { student_id: 2 }}
    assert_redirected_to admin_semester_section_enrollment_path(semesters(:spring), sections(:jck1003_section_1),enrollments(:stews_enrollment))
  end

  test "should_destroy_enrollment" do
    assert_difference('Enrollment.count', -1) do
      delete admin_semester_section_enrollment_url(semesters(:spring),sections(:jck1003_section_1),enrollments(:stews_enrollment))
    end

    assert_redirected_to admin_semester_section_path( semesters(:spring), sections(:jck1003_section_1) )
  end
end
