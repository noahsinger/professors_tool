require 'test_helper'

class Admin::RequirementsControllerTest < ActionController::TestCase
  cannot_access_actions
  
  def setup
    login_as(:admin)
  end
  
  test "should get new" do
    get :new, :course_id => courses(:intro_to_jackassery).id, :lab_id => labs(:hello_world).id
    assert_response :success
  end
  
  test "should create requirement" do
    assert_difference('Requirement.count') do
      post :create, :course_id => courses(:intro_to_jackassery).id, :lab_id => labs(:hello_world).id, 
      :requirement => { 
        :description => "something",
        :points => 50
      }
    end
  
    assert_redirected_to admin_course_lab_path(courses(:intro_to_jackassery),labs(:hello_world))
  end
  
  test "should get edit" do
    get :edit, :id => requirements(:do_well).to_param, :course_id => courses(:intro_to_jackassery).id, :lab_id => labs(:hello_world).id
    assert_response :success
  end
  
  test "should update requirement" do
    put :update, :id => requirements(:do_well).to_param, :course_id => courses(:intro_to_jackassery).id, :lab_id => labs(:hello_world).id,
        :requirement => { :description => 'blah blah' }
    assert_redirected_to admin_course_lab_path(courses(:intro_to_jackassery),labs(:hello_world))
  end
  
  test "should destroy requirement" do
    assert_difference('Requirement.count', -1) do
      delete :destroy, :id => requirements(:do_well).to_param, :course_id => courses(:intro_to_jackassery).id, :lab_id => labs(:hello_world).id
    end
  
    assert_redirected_to admin_course_lab_path(courses(:intro_to_jackassery),labs(:hello_world))
  end
end
