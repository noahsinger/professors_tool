require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new/login page" do
    get new_session_url
    assert_response :success
  end

  test "should send to the admin page with valid credentials" do
    post sessions_url, params: {username: users(:admin).username, password: 'secret'}
    assert_redirected_to admin_admin_index_path
  end

  test "should not send to admin page with invalid credentials" do
    post sessions_url, params: {username: users(:admin).username, password: 'bad'}
    assert_response :success #stay on the same page
  end
end
