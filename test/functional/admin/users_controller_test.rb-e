require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  cannot_access_actions
  
  def setup
    login_as(:admin)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, 
      :user => { 
        :username => 'Something',
        :password => "something"
      }
    end

    assert_redirected_to admin_user_path(assigns(:user))
  end

  test "should show user" do
    get :show, :id => users(:admin).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => users(:admin).to_param
    assert_response :success
  end

  test "should update user" do
    put :update, :id => users(:admin).to_param,
        :user => { :username => 'blah' }
    assert_redirected_to admin_user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:admin).to_param
    end

    assert_redirected_to admin_users_path
  end
end
