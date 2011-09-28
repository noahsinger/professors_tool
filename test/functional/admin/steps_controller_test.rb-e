require 'test_helper'

class Admin::StepsControllerTest < ActionController::TestCase
  cannot_access_actions
  
  def setup
    login_as(:admin)
  end
  
  test "should get new" do
    get :new, :how_to_id => how_tos(:one)
    assert_response :success
  end
  
  test "should create step" do
    assert_difference('Step.count') do
      post :create, :how_to_id => how_tos(:one), 
      :step => { 
        :title => 'Something',
        :instructions => "something",
        :image => fixture_file_upload('files/rails.png', 'images/png')
      }
    end
  
    assert_redirected_to admin_how_to_path(assigns(:how_to))
  end
  
  test "should show step" do
    get :show, :id => steps(:one), :how_to_id => how_tos(:one)
    assert_response :success
  end
  
  test "should get edit" do
    get :edit, :id => steps(:one), :how_to_id => how_tos(:one)
    assert_response :success
  end
  
  test "should update step" do
    put :update, :id => steps(:one), :how_to_id => how_tos(:one),
        :step => { :title => 'blah blah' }
    assert_redirected_to admin_how_to_step_path(assigns(:how_to),assigns(:step))
  end
  
  test "should destroy step" do
    assert_difference('Step.count', -1) do
      delete :destroy, :id => steps(:one), :how_to_id => how_tos(:one)
    end
  
    assert_redirected_to admin_how_to_path(assigns(:how_to))
  end
  
  test "should sort steps" do
    post :sort, :how_to_id => how_tos(:one), :steps => [2,1]
    assert_response :success
    
    assert_equal [1,2], assigns(:how_to).steps.map {|s| s.position}
  end
end
