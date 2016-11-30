require 'test_helper'

class Admin::DivisionsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/divisions', {},
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

  test "should_get_index" do
    get admin_divisions_url
    assert_response :success
    assert_not_nil assigns(:divisions)
  end

  test "should_get_new" do
    get new_admin_division_url
    assert_response :success
  end

  test "should_create_division" do
    assert_difference('Division.count') do
      post admin_divisions_url,
        params: {
          division: {
            name: 'Test Division',
            phone_number: '9185555555',
            office_number: 'xxx212',
            associate_dean: 'Test Dean'
          }
        }
    end

    assert_redirected_to admin_division_path(assigns(:division))
  end

  test "should_show_division" do
    get admin_division_url(divisions(:bit))
    assert_response :success
  end

  test "should_get_edit" do
    get edit_admin_division_url(divisions(:bit))
    assert_response :success
  end

  test "should_update_division" do
    put admin_division_url(divisions(:bit)), params: {division: { name: 'new test division' }}
    assert_redirected_to admin_division_path(assigns(:division))
  end

  test "should_destroy_division" do
    assert_difference('Division.count', -1) do
      delete admin_division_url(divisions(:bit))
    end

    assert_redirected_to admin_divisions_path
  end
end
