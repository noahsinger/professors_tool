require 'test_helper'

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  test "should_get_index" do
    get semester_section_assignments_url(sections(:jck1003_section_1).semester, sections(:jck1003_section_1))
    assert_response :success
    assert_not_nil assigns(:assignments)
  end

  test "should_show_assignment" do
    get semester_section_assignment_url(sections(:jck1003_section_1).semester, sections(:jck1003_section_1), assignments(:lab01))
    assert_response :success
  end

  test "RSS feed should be accessible" do
    get semester_section_assignments_url(sections(:jck1003_section_1).semester, sections(:jck1003_section_1),format: :rss)
    assert_response :success
  end
end
