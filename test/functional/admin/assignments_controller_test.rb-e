require 'test_helper'

class Admin::AssignmentsControllerTest < ActionController::TestCase  
  cannot_access_actions([:id => 1,:section_id => 2,:semester_id => 3])
  
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
    Assignment.any_instance.expects(:tweet).returns(true)
    
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
  
  test "new assignments should have a short url" do
    Assignment.any_instance.expects(:tweet).returns(true)
    
    post :create, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id, 
    :assignment => { 
      :title => 'Lab99',
      :duedate => 2.weeks.from_now,
      :lab_id => 2
    }
    
    assert_respond_to assigns(:assignment), :generate_short_url
    # assert_equal googl.shorten(semester_section_assignment_url(assigns(:assignment).section.semester,assigns(:assignment).section,assigns(:assignment)), :host => "ingenio.us.com").shortUrl, assigns(:assignment).short_url
    assert_not_nil assigns(:assignment).short_url
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
