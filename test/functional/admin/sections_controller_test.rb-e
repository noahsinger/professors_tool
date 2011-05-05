require 'test_helper'

class Admin::SectionsControllerTest < ActionController::TestCase
  def test_should_not_get_index_when_not_logged_in
    get :index, :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :redirect
    assert_redirected_to signin_admin_admin_path
  end
  
  def test_should_get_index
    login_as(:admin)
    get :index, :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
    assert_not_nil assigns(:sections)
  end

  def test_should_get_new
    login_as(:admin)
    get :new, :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  def test_should_create_section
    login_as(:admin)

    assert_difference('Section.count') do
      post :create, :semester_id => sections(:jck1003_section_1).semester_id, 
      :section => {
        :course_id => "1",
        :call_number => "12345",
        :section_number => "111",
        :room_number => "MC000",
        :meeting_days => "MW",
        :start_time => "8:30am",
        :end_time => "9:50am",
        :start_date => 5.months.ago,
        :end_date => 2.months.ago,
        :instructor_id => instructors(:me).id
      }
    end

    assert_redirected_to admin_semester_section_path(assigns(:semester), assigns(:section))
  end

  def test_should_show_section
    login_as(:admin)
    get :show, :id => sections(:jck1003_section_1).id, :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  def test_should_get_edit
    login_as(:admin)
    get :edit, :id => sections(:jck1003_section_1).id, :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  def test_should_update_section
    login_as(:admin)
    
    post :update, :id => sections(:jck1003_section_1).id, :semester_id => sections(:jck1003_section_1).semester_id,
    :section => {
      :course_id => "1",
      :call_number => "54321",
      :section_number => "111",
      :room_number => "MC000",
      :meeting_days => "MW",
      :start_time => "8:30am",
      :end_time => "9:50am",
      :start_date => 5.months.ago,
      :end_date => 2.months.ago,
      :instructor_id => instructors(:me).id
    }
    
    assert_redirected_to admin_semester_section_path(assigns(:semester), assigns(:section))
  end

  def test_should_destroy_section
    login_as(:admin)
    assert_difference('Section.count', -1) do
      delete :destroy, :id => sections(:jck1003_section_1).id, :semester_id => sections(:jck1003_section_1).semester_id
    end

    assert_redirected_to admin_semester_sections_path(assigns(:semester))
  end

end
