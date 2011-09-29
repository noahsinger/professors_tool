require 'test_helper'

class Admin::ExamplesControllerTest < ActionController::TestCase
  cannot_access_actions([:id => 3, :section_id => 2, :semester_id => 1])
  
  def setup
    login_as(:admin)
  end
  
  test "should get index" do
    get :index, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
    assert_not_nil assigns(:examples)
  end

  test "should get new" do
    get :new, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  test "should create example" do
    assert_difference('Example.count') do
      post :create, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id, 
      :example => { 
        :name => 'Something',
        :description => "something",
        :file => fixture_file_upload('files/file.zip', 'application/zip')
      }
    end

    assert_redirected_to admin_semester_section_example_path(assigns(:semester),assigns(:section),assigns(:example))
  end

  test "should show example" do
    get :show, :id => examples(:one).to_param, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => examples(:one).to_param, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    assert_response :success
  end

  test "should update example" do
    put :update, :id => examples(:one).to_param, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id,
    :example => { :name => 'blah blah' }
    assert_redirected_to admin_semester_section_example_path(assigns(:semester),assigns(:section),assigns(:example))
  end

  test "should destroy example" do
    assert_difference('Example.count', -1) do
      delete :destroy, :id => examples(:one).to_param, :section_id => sections(:jck1003_section_1), :semester_id => sections(:jck1003_section_1).semester_id
    end

    assert_redirected_to admin_semester_section_examples_path(assigns(:semester),assigns(:section))
  end
end
