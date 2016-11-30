require 'test_helper'

class Admin::HowTosControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/how_tos', {},
                        {action: 'index'}    => :get,
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
  end

  test "should_get_index" do
    get admin_how_tos_url
    assert_response :success
  end

  test "should_get_new" do
    get new_admin_how_to_url
    assert_response :success
  end

  test "should_create_how_to" do
    assert_difference('HowTo.count') do
      post admin_how_tos_url,
        params: {
          how_to: {
            title: 'Something',
            description: 'This something'
          }
        }
    end

    assert_redirected_to admin_how_to_path(assigns(:how_to))
  end

  test "should_get_edit" do
    get edit_admin_how_to_url(how_tos(:one))
    assert_response :success
  end

  test "should_update_how_to" do
    put admin_how_to_url(how_tos(:one)), params: {how_to: { title: 'new title' }}
    assert_redirected_to admin_how_to_path(assigns(:how_to))
  end

  test "should_destroy_how_to" do
    assert_difference('HowTo.count', -1) do
      delete admin_how_to_url(how_tos(:one))
    end

    assert_redirected_to admin_how_tos_path
  end
end
