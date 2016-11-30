require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  def setup
   xxx@xxx.xxx = Semester.first
    @section xxx@xxx.xxx
  end

  test "should_get_index" do
    get xxx@xxx.xxx
    assert_response :success
    assert_not_nil assigns(:sections)
  end

  test "should_show_section" do
    get xxx@xxx.xxx @section)
    assert_redirected_to xxx@xxx.xxx @section)
  end

  test "should_get_syllabus" do
    get xxx@xxx.xxx @section)
    assert_response :success
  end
end
