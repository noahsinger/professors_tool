require 'test_helper'

class Admin::StudentsControllerTest < ActionController::TestCase
  cannot_access_actions([:id => 3, :section_id => 2, :semester_id => 1])
  
  def setup
    login_as(:admin)
  end
  
  test "should get index" do
    get :index, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end
  
  test "should create student" do
    assert_difference('Student.count') do
      post :create, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id, 
            :student => { 
              :first_name => "Something",
              :last_name => "Something",
              :email => xxx@xxx.xxx
            }
    end
  
    assert_not_nil assigns(:enrollment)
    assert_equal assigns(:student).id, assigns(:enrollment).student_id
    assert_equal sections(:jck1003_section_1).id, assigns(:enrollment).section_id
  
    assert_redirected_to admin_semester_section_path(assigns(:semester),assigns(:section))
  end
  
  test "should show student" do
    get :show, :id => students(:stew), :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end
  
  test "should get edit" do
    get :edit, :id => students(:stew), :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end
  
  test "should update student" do
    put :update, :id => students(:stew), :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id,
        :student => { :first_name => 'blah blah' }
    assert_redirected_to admin_student_path(assigns(:student))
  end
  
  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, :id => students(:stew), :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    end
  
    assert_redirected_to admin_students_path
  end
end
