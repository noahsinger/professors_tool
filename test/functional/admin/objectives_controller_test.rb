require 'test_helper'

class Admin::ObjectivesControllerTest < ActionController::TestCase
  cannot_access_actions
  
  def setup
    login_as(:admin)
  end

  test "should get index" do
    get :index, :course_id => courses(:intro_to_jackassery)
    assert_response :success
  end
  
  test "should get new" do
    get :new, :course_id => courses(:intro_to_jackassery).id
    assert_response :success
  end
  
  test "should create objective" do
    assert_difference('Objective.count') do
      post :create, :course_id => courses(:intro_to_jackassery), 
      :objective => { 
        :description => "something"
      }
    end
  
    assert_redirected_to admin_course_objectives_path(courses(:intro_to_jackassery))
  end
  
  test "should get edit" do
    get :edit, :id => objectives(:one), :course_id => courses(:intro_to_jackassery)
    assert_response :success
  end
  
  test "should update objective" do
    put :update, :id => objectives(:one), :course_id => courses(:intro_to_jackassery),
        :objective => { :description => 'blah blah' }
    assert_redirected_to admin_course_objectives_path(courses(:intro_to_jackassery))
  end
  
  test "should destroy objective" do
    assert_difference('Objective.count', -1) do
      delete :destroy, :id => objectives(:one), :course_id => courses(:intro_to_jackassery)
    end
  
    assert_redirected_to admin_course_objectives_path(courses(:intro_to_jackassery))
  end
end
