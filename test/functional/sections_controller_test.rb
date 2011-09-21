require 'test_helper'

class SectionsControllerTest < ActionController::TestCase
  def setup
   xxx@xxx.xxx = Semester.first
    @section xxx@xxx.xxx
  end
  
  def test_should_get_index
    get :index, :semester_id xxx@xxx.xxx
    assert_response :success
    assert_not_nil assigns(:sections)
  end

  def test_should_show_section
    get :show, :semester_id => @semester.id, :id xxx@xxx.xxx
    # assert_response :success
    assert_redirected_to xxx@xxx.xxx @section)
  end

  def test_should_get_syllabus
    get :syllabus, :semester_id => @semester.id, :id xxx@xxx.xxx
    assert_response :success
  end
end
