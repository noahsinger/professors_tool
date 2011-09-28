require 'test_helper'

class Admin::MaterialsControllerTest < ActionController::TestCase
  cannot_access_actions
  
  def setup
    login_as(:admin)
  end

  test "should get index" do
    get :index, :course_id => courses(:intro_to_jackassery)
    assert_response :success
  end
  
  test "should get show" do
    get :show, :id => materials(:one), :course_id => courses(:intro_to_jackassery)
    assert_response :success
  end
  
  test "should get new" do
    get :new, :course_id => courses(:intro_to_jackassery).id
    assert_response :success
  end
  
  test "should create material" do
    assert_difference('Material.count') do
      post :create, :course_id => courses(:intro_to_jackassery), 
      :material => { 
        :title => 'Something',
        :description => "something",
        :file => fixture_file_upload('files/file.zip', 'application/zip')
      }
    end
  
    assert_redirected_to admin_course_path(courses(:intro_to_jackassery))
  end
  
  test "should get edit" do
    get :edit, :id => materials(:one), :course_id => courses(:intro_to_jackassery)
    assert_response :success
  end
  
  test "should update material" do
    put :update, :id => materials(:one), :course_id => courses(:intro_to_jackassery),
        :material => { :description => 'blah blah' }
    assert_redirected_to admin_course_path(courses(:intro_to_jackassery))
  end
  
  test "should destroy material" do
    assert_difference('Material.count', -1) do
      delete :destroy, :id => materials(:one), :course_id => courses(:intro_to_jackassery)
    end
  
    assert_redirected_to admin_course_path(courses(:intro_to_jackassery))
  end
end
