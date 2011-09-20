require 'test_helper'

class AssignmentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
    assert_not_nil assigns(:assignments)
  end

  def test_should_show_assignment
    get :show, :section_id => sections(:jck1003_section_1), 
    		   :semester_id => sections(:jck1003_section_1).semester_id, 
    		   :id => assignments(:lab01).id
    assert_response :success
  end
end













































