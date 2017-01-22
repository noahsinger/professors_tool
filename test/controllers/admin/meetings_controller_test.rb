require 'test_helper'

class Admin::MeetingsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/meetings', {semester_id: 1, section_id: 1},
                        {action: 'index'}    => :get)

  setup do
	  login_as(:admin)
   xxx@xxx.xxx = meetings(:one)
  end

  test "should get index" do
    get admin_semester_section_meetings_path(sections(:jck1003_section_1).semester,sections(:jck1003_section_1))
    assert_response :success
    assert_not_nil assigns(:meetings)
  end
end
