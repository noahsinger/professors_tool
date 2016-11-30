require 'test_helper'

class Admin::AttendancesControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/attendances', {semester_id: 1, section_id: 1, meeting_id: 1},
                        {action: 'index' }    => :get,
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'show', id: 1}     => :get,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
  end

  setup do
   xxx@xxx.xxx = attendances(:one)
  end

  test "should get index" do
    get admin_semester_section_meeting_attendances_url(semester_id: 1, section_id: 1, meeting_id: 1)
    assert_response :success
    assert_not_nil assigns(:attendances)
  end

  test "should get new" do
    get new_admin_semester_section_meeting_attendance_url(semester_id: 1, section_id: 1, meeting_id: 1)
    assert_response :success
  end

  test "should create attendance" do
    assert_difference('Attendance.count') do
      post admin_semester_section_meeting_attendances_url(semester_id: 1, section_id: 1, meeting_id: 1),
        params: {attendance: { enrollment_id: 1, attendance_status_id: 1 }}
    end

    assert_redirected_to admin_semester_section_meeting_attendance_path(assigns(:semester),assigns(:section),assigns(:meeting),assigns(:attendance))
  end

  test "should show attendance" do
    get admin_semester_section_meeting_attendance_url(semester_id: 1, section_id: 1, meeting_id: 1, id: 1)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_semester_section_meeting_attendance_url(semester_id: 1, section_id: 1, meeting_id: 1, id: 1)
    assert_response :success
  end

  test "should update attendance" do
    patch admin_semester_section_meeting_attendance_url(semester_id: 1, section_id: 1, meeting_id: 1, id: 1),
      params: {attendance: { enrollment_id: 1, attendance_status_id: 2 }}
    assert_redirected_to admin_semester_section_meeting_attendances_path(assigns(:semester),assigns(:section),assigns(:meeting))
  end

  test "should destroy attendance" do
    assert_difference('Attendance.count', -1) do
      delete admin_semester_section_meeting_attendance_url(semester_id: 1, section_id: 1, meeting_id: 1, id: 1)
    end

    assert_redirected_to admin_semester_section_meeting_attendances_path(assigns(:semester),assigns(:section),assigns(:meeting))
  end
end
