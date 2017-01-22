require 'test_helper'

class Admin::AttendancesControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/attendances', {semester_id: 1, section_id: 1, meeting_id: 1},
                        {action: 'index' }    => :get,
                        {action: 'update', id: 1}   => :put)

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

  test "should update attendance" do
    patch admin_semester_section_meeting_attendance_url(semester_id: 1, section_id: 1, meeting_id: 1, id: 1),
      params: {attendance: { enrollment_id: 1, attendance_status_id: 2 }}
    assert_redirected_to admin_semester_section_meeting_attendances_path(assigns(:semester),assigns(:section),assigns(:meeting))
  end
end
