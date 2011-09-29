require 'test_helper'

class Admin::TutorialsControllerTest < ActionController::TestCase
  cannot_access_actions([:id => 2, :course_id => 1],{:index => :get, :destroy => :delete, :sort => :post, :add_how_to => :post})
  
  def setup
    login_as(:admin)
  end
  
  test "should get index" do
    get :index, :course_id => courses(:intro_to_jackassery)
    assert_response :success
    assert_not_nil assigns(:tutorials)
  end

  test "should destroy tutorial" do
    assert_difference('Tutorial.count', -1) do
      delete :destroy, :id => tutorials(:one), :course_id => courses(:intro_to_jackassery)
    end
  
    assert_redirected_to admin_course_tutorials_path(assigns(:course))
  end
  
  test "should sort tutorials" do
    post :sort, :course_id => courses(:intro_to_jackassery), :tutorials => [2,1]
    assert_response :success
    
    assert_equal [1,2], assigns(:course).tutorials.map {|t| t.position}
  end
  
  test "should add a how to" do
    post :add_how_to, :course_id => courses(:intro_to_jackassery), :how_to_id => how_tos(:one)
    
    assert_not_nil assigns(:tutorial)
    assert_equal courses(:intro_to_jackassery).id, assigns(:tutorial).course_id
    assert_equal how_tos(:one).id, assigns(:tutorial).how_to_id
    
    assert_response :success
  end
end
