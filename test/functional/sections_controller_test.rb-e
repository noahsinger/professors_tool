require 'test_helper'

class SectionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index, :semester_id => semesters(:fall).id
    assert_response :success
    assert_not_nil assigns(:sections)
  end

  def test_should_show_section
    get :show, :semester_id => semesters(:fall).id, :id => sections(:jck1003_section_1).id
    # assert_response :success
    assert_redirected_to semester_section_assignments_path(sections(:jck1003_section_1).semester, sections(:jck1003_section_1))
  end

  def test_should_get_syllabus
    get :syllabus, :semester_id => semesters(:fall).id, :id => sections(:jck1003_section_1).id
    assert_response :success
  end
end
