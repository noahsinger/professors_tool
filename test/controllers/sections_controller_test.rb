require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @semester = Semester.first
    @section = @semester.sections.first
  end

  test "should_get_index" do
    get semester_sections_url(@semester)
    assert_response :success
    assert_not_nil assigns(:sections)
  end

  test "should_show_section" do
    get semester_section_url(@semester, @section)
    assert_redirected_to semester_section_assignments_path(@semester, @section)
  end

  test "should_get_syllabus" do
    get syllabus_semester_section_url(@semester, @section)
    assert_response :success
  end
end
