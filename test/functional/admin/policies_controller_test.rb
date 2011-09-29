require 'test_helper'

class Admin::PoliciesControllerTest < ActionController::TestCase
  cannot_access_actions([:id => 2, :course_id => 1],{:index => :get, :new => :get, :create => :post, :destroy => :delete, :sort => :post, :add_syllabus_part => :post})
  
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
  
  test "should create policy" do
    assert_difference('Policy.count') do
      post :create, :course_id => courses(:intro_to_jackassery), 
      :policy => { 
        :syllabus_part_id => syllabus_parts(:one)
      }
    end
  
    assert_redirected_to admin_course_path(courses(:intro_to_jackassery))
  end
    
  test "should destroy policy" do
    assert_difference('Policy.count', -1) do
      delete :destroy, :id => policies(:one), :course_id => courses(:intro_to_jackassery)
    end
  
    assert_redirected_to admin_course_policies_path(courses(:intro_to_jackassery))
  end
  
  test "should sort" do
    post :sort, :course_id => courses(:intro_to_jackassery), :policies => [2,1]
    assert_response :success
    
    assert_equal [1,2], assigns(:course).policies.map {|p| p.position}
  end
  
  test "should add syllabus part" do
    post :add_syllabus_part, :course_id => courses(:intro_to_jackassery), :syllabus_part_id => syllabus_parts(:one)
    assert_response :success
  end
end
