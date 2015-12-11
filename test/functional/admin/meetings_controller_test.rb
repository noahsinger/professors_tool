require 'test_helper'

class Admin::MeetingsControllerTest < ActionController::TestCase
	cannot_access_actions([:id => 2, :semester_id => 1, :section_id => 1])
  
  setup do
	  login_as(:admin)
   xxx@xxx.xxx = meetings(:one)
  end

  test "should get index" do
    get :index, :semester_id => sections(:jck1003_section_1).semester, :section_id => sections(:jck1003_section_1)
    assert_response :success
    assert_not_nil assigns(:meetings)
  end

  test "should get new" do
    get :new, :semester_id => sections(:jck1003_section_1).semester, :section_id => sections(:jck1003_section_1)
    assert_response :success
  end

  test "should create meeting" do
    assert_difference('Meeting.count') do
      post :create, :semester_id => sections(:jck1003_section_1).semester, :section_id => sections(:jck1003_section_1),
	      meeting: { xxx@xxx.xxx }
    end

    assert_redirected_to admin_semester_section_meeting_path(assigns(:section).semester,assigns(:section),assigns(:meeting))
  end

  test "should show meeting" do
    get :show, xxx@xxx.xxx :semester_id => sections(:jck1003_section_1).semester, :section_id => sections(:jck1003_section_1)
    assert_response :success
  end

  test "should get edit" do
    get :edit, xxx@xxx.xxx :semester_id => sections(:jck1003_section_1).semester, :section_id => sections(:jck1003_section_1)
    assert_response :success
  end

  test "should update meeting" do
    put :update, xxx@xxx.xxx :semester_id => sections(:jck1003_section_1).semester, :section_id => sections(:jck1003_section_1),
    	meeting: { xxx@xxx.xxx }
    assert_redirected_to admin_semester_section_meeting_path(assigns(:section).semester,assigns(:section),assigns(:meeting))
  end

  test "should destroy meeting" do
    assert_difference('Meeting.count', -1) do
      delete :destroy, xxx@xxx.xxx :semester_id => sections(:jck1003_section_1).semester, :section_id => sections(:jck1003_section_1)
    end

    assert_redirected_to admin_semester_section_meetings_path(assigns(:section).semester,assigns(:section))
  end
end
