require 'test_helper'

class Admin::ExamplesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_examples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create example" do
    assert_difference('Admin::Example.count') do
      post :create, :example => { }
    end

    assert_redirected_to example_path(assigns(:example))
  end

  test "should show example" do
    get :show, :id => admin_examples(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => admin_examples(:one).to_param
    assert_response :success
  end

  test "should update example" do
    put :update, :id => admin_examples(:one).to_param, :example => { }
    assert_redirected_to example_path(assigns(:example))
  end

  test "should destroy example" do
    assert_difference('Admin::Example.count', -1) do
      delete :destroy, :id => admin_examples(:one).to_param
    end

    assert_redirected_to admin_examples_path
  end
end
