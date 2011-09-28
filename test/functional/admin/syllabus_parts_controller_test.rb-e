require 'test_helper'

class Admin::SyllabusPartsControllerTest < ActionController::TestCase
  cannot_access_actions
  
  def setup
    login_as(:admin)
    session[:referrer] = "blah"
  end
  
  test "should create syllabus part" do
    assert_difference('SyllabusPart.count') do
      post :create, 
            :syllabus_part => { 
              :name => "Something",
              :title => "Something",
              :description => "something blah"
            }
    end
  
    assert_not_nil assigns(:syllabus_part)
  
    assert_response :success
  end
  
  test "should show syllabus part" do
    get :show, :id => syllabus_parts(:one)
    assert_response :success
  end
  
  test "should get edit" do
    get :edit, :id => syllabus_parts(:one)
    assert_response :success
  end
  
  test "should update syllabus part" do
    put :update, :id => syllabus_parts(:one),
        :syllabus_part => { :title => 'blah blah' }
    assert_redirected_to session[:referrer]
  end
  
  test "should destroy syllabus part" do
    assert_difference('SyllabusPart.count', -1) do
      delete :destroy, :id => syllabus_parts(:one)
    end
  
    assert_redirected_to session[:referrer]
  end
end
