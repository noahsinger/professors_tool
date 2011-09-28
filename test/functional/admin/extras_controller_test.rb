require 'test_helper'

class Admin::ExtrasControllerTest < ActionController::TestCase
  cannot_access_actions({:new => :get, :create => :post, :edit => :get, :update => :post, :destroy => :delete})
  
  def setup
    login_as(:admin)
  end
  
  test "should get new" do
    get :new, :course_id => courses(:intro_to_jackassery).id, :lab_id => labs(:hello_world).id
    assert_response :success
  end
  
  test "should create extra" do
    assert_difference('Extra.count') do
      post :create, :course_id => courses(:intro_to_jackassery).id, :lab_id => labs(:hello_world).id, 
      :extra => { 
        :description => "something",
        :file => fixture_file_upload('files/file.zip', 'application/zip')
      }
    end
  
    assert_redirected_to admin_course_lab_path(courses(:intro_to_jackassery),labs(:hello_world))
  end
  
  test "should get edit" do
    get :edit, :id => extras(:download_1).to_param, :course_id => courses(:intro_to_jackassery).id, :lab_id => labs(:hello_world).id
    assert_response :success
  end
  
  test "should update extra" do
    put :update, :id => extras(:download_1).to_param, :course_id => courses(:intro_to_jackassery).id, :lab_id => labs(:hello_world).id,
    :extra => { :description => 'blah blah' }
    assert_redirected_to admin_course_lab_path(courses(:intro_to_jackassery),labs(:hello_world))
  end
  
  test "should destroy extra" do
    assert_difference('Extra.count', -1) do
      delete :destroy, :id => extras(:download_1).to_param, :course_id => courses(:intro_to_jackassery).id, :lab_id => labs(:hello_world).id
    end
  
    assert_redirected_to admin_course_lab_path(courses(:intro_to_jackassery),labs(:hello_world))
  end
end
