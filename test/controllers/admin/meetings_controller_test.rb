require 'test_helper'

class Admin::MeetingsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/meetings', {semester_id: 1, section_id: 1},
                        {action: 'index'}    => :get,
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'show', id: 1}     => :get,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  setup do
	  login_as(:admin)
   xxx@xxx.xxx = meetings(:one)
  end

  test "should get index" do
    get admin_semester_section_meetings_path(sections(:jck1003_section_1).semester,sections(:jck1003_section_1))
    assert_response :success
    assert_not_nil assigns(:meetings)
  end

  test "should get new" do
    get new_admin_semester_section_meeting_path(sections(:jck1003_section_1).semester,sections(:jck1003_section_1))
    assert_response :success
  end

  test "should create meeting" do
    assert_difference('Meeting.count') do
      post admin_semester_section_meetings_path(sections(:jck1003_section_1).semester,sections(:jck1003_section_1)),
	      params: {meeting: { xxx@xxx.xxx }}
    end

    assert_redirected_to admin_semester_section_meeting_path(assigns(:section).semester,assigns(:section),assigns(:meeting))
  end

  test "should show meeting" do
    get xxx@xxx.xxx
    assert_response :success
  end

  test "should get edit" do
    get xxx@xxx.xxx
    assert_response :success
  end

  test "should update meeting" do
    put xxx@xxx.xxx
    	params: {meeting: { xxx@xxx.xxx }}
    assert_redirected_to admin_semester_section_meeting_path(assigns(:section).semester,assigns(:section),assigns(:meeting))
  end

  test "should destroy meeting" do
    assert_difference('Meeting.count', -1) do
      delete xxx@xxx.xxx
    end

    assert_redirected_to admin_semester_section_meetings_path(assigns(:section).semester,assigns(:section))
  end
end
