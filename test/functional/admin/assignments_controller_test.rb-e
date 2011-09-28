require 'test_helper'

class Admin::AssignmentsControllerTest < ActionController::TestCase  
  cannot_access_actions
  
  def setup
    login_as(:admin)
  end
  
  def test_should_get_index
    get :index, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
    assert_not_nil assigns(:assignments)
  end

  def test_should_get_new
    get :new, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  def test_should_create_assignment
    assert_difference('Assignment.count') do
      post :create, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id, 
      :assignment => { 
        :title => 'Lab99',
        :duedate => 2.weeks.from_now,
        :lab_id => 2
      }
    end

    assert_redirected_to admin_semester_section_assignment_path(assigns(:semester),assigns(:section),assigns(:assignment))
  end

  def test_should_show_assignment
    get :show, :id => assignments(:lab01).id, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => assignments(:lab01).id, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  def test_should_update_assignment
    post :update, :id => assignments(:lab01).id, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id,
    :assignment => { }
    assert_redirected_to admin_semester_section_assignment_path(assigns(:semester),assigns(:section),assigns(:assignment))
  end

  def test_should_destroy_assignment
    assert_difference('Assignment.count', -1) do
      delete :destroy, :id => assignments(:lab01).id, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    end

    assert_redirected_to admin_semester_section_assignments_path(assigns(:semester),assigns(:section))
  end
end
