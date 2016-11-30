require 'test_helper'

class Admin::InstructorsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/instructors', {},
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
    get admin_instructors_url
    assert_response :success
    assert_not_nil assigns(:instructors)
  end

  test "should_get_new" do
    get new_admin_instructor_url
    assert_response :success
  end

  test "should_create_instructor" do
    assert_difference('Instructor.count') do
      post admin_instructors_url,
        params: {
          instructor: { first_name: 'test',
            last_name: 'test',
            phone_number: '9185555555',
            email: xxx@xxx.xxx
            division_id: divisions(:bit).id
          }
        }
    end

    assert_redirected_to admin_instructor_path(assigns(:instructor))
  end

  test "should_show_instructor" do
    get admin_instructor_url(instructors(:me))
    assert_response :success
  end

  test "should_get_edit" do
    get edit_admin_instructor_url(instructors(:me))
    assert_response :success
  end

  test "should_update_instructor" do
    put admin_instructor_url(instructors(:me)), params: {instructor: { first_name: 'Victrola' }}
    assert_redirected_to admin_instructor_path(assigns(:instructor))
  end

  test "should_destroy_instructor" do
    assert_difference('Instructor.count', -1) do
      delete admin_instructor_url(instructors(:me))
    end

    assert_redirected_to admin_instructors_path
  end
end
