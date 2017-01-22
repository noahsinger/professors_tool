require 'test_helper'

class Admin::HowTosControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/how_tos', {},
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
  end

  test "should_get_new" do
    get new_admin_how_to_url(course_id: courses(:intro_to_jackassery).id)
    assert_response :success
  end

  test "should_create_how_to" do
    assert_difference('HowTo.count') do
      post admin_how_tos_url,
        params: {
          course_id: courses(:intro_to_jackassery).id,
          how_to: {
            title: 'Something',
            description: 'This something'
          }
        }
    end

    assert_redirected_to admin_how_to_steps_path(assigns(:how_to), course_id: assigns(:course))
  end

  test "should_get_edit" do
    get edit_admin_how_to_url(how_tos(:one),course_id: courses(:intro_to_jackassery).id)
    assert_response :success
  end

  test "should_update_how_to" do
    put admin_how_to_url(how_tos(:one)), 
        params: {
          course_id: courses(:intro_to_jackassery).id,
          how_to: { 
            title: 'new title' 
          }
        }
    assert_redirected_to admin_how_to_steps_path(assigns(:how_to), course_id: assigns(:course))
  end

  test "should_destroy_how_to" do
    assert_difference('HowTo.count', -1) do
      delete admin_how_to_url(how_tos(:one),course_id: courses(:intro_to_jackassery).id)
    end

    assert_redirected_to admin_course_tutorials_url(assigns(:course))
  end
end
