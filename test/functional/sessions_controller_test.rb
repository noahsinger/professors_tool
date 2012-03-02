require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new/login page" do
    get :new
    assert_response :success
  end
  
  test "should create new sessions with valid credentials" do
    post :create, username: users(:admin).username, password: 'secret'
    assert_equal users(:admin).id, session[:user_id]
    
    assert_redirected_to admin_admin_index_path
  end
  
  test "should not create session with invalid credentials" do
    post :create, username: users(:admin).username, password: 'bad'
    assert_nil session[:user_id]
    
    post :create, username: 'bad', password: 'secret'
    assert_nil session[:user_id]
  end
end
