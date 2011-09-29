require 'test_helper'

class Admin::EnrollmentsControllerTest < ActionController::TestCase
  cannot_access_actions([:semester_id => 3, :section_id => 2, :id => 1], {:show => :get, :new => :get, :create => :post, :update => :put, :destroy => :delete})
  
  def setup
    login_as(:admin)
  end
  
  def test_should_get_show
    get :show, :semester_id => semesters(:spring).id, :section_id => sections(:jck1003_section_1).id, :id => enrollments(:stews_enrollment)
    assert_response :success
  end
  
  def test_should_get_new
    get :new, :semester_id => semesters(:spring).id, :section_id => sections(:jck1003_section_1).id
    assert_response :success
  end
  
  def test_should_create_enrollment
    assert_difference('Enrollment.count') do
      post :create, :semester_id => semesters(:spring).id, :section_id => sections(:jck1003_section_1).id, :email => students(:stew).email
    end
  
    assert_redirected_to admin_semester_section_path( semesters(:spring), sections(:jck1003_section_1) )
  end
  
  def test_should_update_enrollment
    post :update, :id => enrollments(:stews_enrollment).id, :enrollment => { :student_id => 2 }, :semester_id => semesters(:spring).id, :section_id => sections(:jck1003_section_1).id
    assert_redirected_to admin_semester_section_enrollment_path(semesters(:spring), sections(:jck1003_section_1),enrollments(:stews_enrollment))
  end
  
  def test_should_destroy_enrollment
    assert_difference('Enrollment.count', -1) do
      delete :destroy, :id => enrollments(:stews_enrollment).id, :semester_id => semesters(:spring).id, :section_id => sections(:jck1003_section_1).id
    end
  
    assert_redirected_to admin_semester_section_path( semesters(:spring), sections(:jck1003_section_1) )
  end
end
