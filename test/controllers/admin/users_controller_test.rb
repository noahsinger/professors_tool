require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/users', {},
                        {action: 'index'}    => :get,
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'show', id: 1}     => :get,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
  end

  test "should get index" do
    get admin_users_url
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get new_admin_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post admin_users_url,
        params: {
          user: {
            username: 'Something',
            password: "something"
          }
        }
    end

    assert_redirected_to admin_user_path(assigns(:user))
  end

  test "should show user" do
    get admin_user_url(users(:admin))
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_user_url(users(:admin))
    assert_response :success
  end

  test "should update user" do
    put admin_user_url(users(:admin)),
      params: {user: { username: 'blah' }}
    assert_redirected_to admin_user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete admin_user_url(users(:admin))
    end

    assert_redirected_to admin_users_path
  end
end
