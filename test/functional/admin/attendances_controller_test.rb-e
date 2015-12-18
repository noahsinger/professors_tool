require 'test_helper'

class Admin::AttendancesControllerTest < ActionController::TestCase
	cannot_access_actions([id: 1, semester_id: 1, section_id: 1, meeting_id: 1])
  
  def setup
    login_as(:admin)
  end
  
  setup do
   xxx@xxx.xxx = attendances(:one)
  end

  test "should get index" do
    get :index, semester_id: 1, section_id: 1, meeting_id: 1
    assert_response :success
    assert_not_nil assigns(:attendances)
  end

  test "should get new" do
    get :new, semester_id: 1, section_id: 1, meeting_id: 1
    assert_response :success
  end

  test "should create attendance" do
    assert_difference('Attendance.count') do
      post :create, semester_id: 1, section_id: 1, meeting_id: 1, attendance: {  }
    end

    assert_redirected_to admin_semester_section_meeting_attendance_path(assigns(:semester),assigns(:section),assigns(:meeting),assigns(:attendance))
  end

  test "should show attendance" do
    get :show, xxx@xxx.xxx semester_id: 1, section_id: 1, meeting_id: 1
    assert_response :success
  end

  test "should get edit" do
    get :edit, xxx@xxx.xxx semester_id: 1, section_id: 1, meeting_id: 1
    assert_response :success
  end

  test "should update attendance" do
    put :update, xxx@xxx.xxx semester_id: 1, section_id: 1, meeting_id: 1,  attendance: {  }
    assert_redirected_to admin_semester_section_meeting_attendance_path(assigns(:semester),assigns(:section),assigns(:meeting),assigns(:attendance))
  end

  test "should destroy attendance" do
    assert_difference('Attendance.count', -1) do
      delete :destroy, xxx@xxx.xxx semester_id: 1, section_id: 1, meeting_id: 1
    end

    assert_redirected_to admin_semester_section_meeting_attendances_path(assigns(:semester),assigns(:section),assigns(:meeting))
  end
end
