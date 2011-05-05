require 'test_helper'

class Admin::AssignmentsControllerTest < ActionController::TestCase
  def test_should_not_get_index_when_not_logged_in
    get :index, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :redirect
    assert_redirected_to signin_admin_admin_path
  end
  
  def test_should_get_index
    login_as(:admin)
    
    get :index, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
    assert_not_nil assigns(:assignments)
  end

  def test_should_get_new
    login_as(:admin)
    get :new, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  def test_should_create_assignment
    login_as(:admin)
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
    login_as(:admin)
    get :show, :id => assignments(:lab01).id, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  def test_should_get_edit
    login_as(:admin)
    get :edit, :id => assignments(:lab01).id, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  def test_should_update_assignment
    login_as(:admin)
    post :update, :id => assignments(:lab01).id, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id,
    :assignment => { }
    assert_redirected_to admin_semester_section_assignment_path(assigns(:semester),assigns(:section),assigns(:assignment))
  end

  def test_should_destroy_assignment
    login_as(:admin)
    assert_difference('Assignment.count', -1) do
      delete :destroy, :id => assignments(:lab01).id, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    end

    assert_redirected_to admin_semester_section_assignments_path(assigns(:semester),assigns(:section))
  end
end
