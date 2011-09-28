require 'test_helper'

class Admin::SectionsControllerTest < ActionController::TestCase
  cannot_access_actions
  
  def setup
    login_as(:admin)
  end
  
  def test_should_get_index
    get :index, :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
    assert_not_nil assigns(:sections)
  end

  def test_should_get_new
    get :new, :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  def test_should_create_section
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
    get :show, :id => sections(:jck1003_section_1).id, :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => sections(:jck1003_section_1).id, :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  def test_should_update_section
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
    assert_difference('Section.count', -1) do
      delete :destroy, :id => sections(:jck1003_section_1).id, :semester_id => sections(:jck1003_section_1).semester_id
    end

    assert_redirected_to admin_semester_sections_path(assigns(:semester))
  end

  test "should show section email page" do
    get :section_email, :id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end
  
  test "should send section email when body included" do
    get :section_email, :id => sections(:jck1003_section_1).id, :semester_id => sections(:jck1003_section_1).semester_id, :body => 'this is the body'
    assert_redirected_to admin_semester_section_path(assigns(:semester), assigns(:section))
  end
end
