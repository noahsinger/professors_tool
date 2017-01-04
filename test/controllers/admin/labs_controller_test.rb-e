require 'test_helper'

class Admin::LabsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/labs', {course_id: 1},
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
    get admin_course_labs_url(courses(:intro_to_jackassery))
    assert_response :success
    assert_not_nil assigns(:labs)
  end

  test "should_get_new" do
    get new_admin_course_lab_url(courses(:intro_to_jackassery))
    assert_response :success
  end

  test "should_create_lab" do
    assert_difference('Lab.count') do
      post admin_course_labs_url(courses(:intro_to_jackassery)),
        params: {
          lab: {
            visible: "true",
            allow_uploads: "true",
            title: 'Hello, World!',
            objective: 'Setup stuff and make it work',
            instructions: 'do a great many things that will be very interesting'
          }
        }
    end

    assert_redirected_to admin_course_lab_path(assigns(:course),assigns(:lab))
  end
  
  test "should_duplicate_lab" do
    assert_difference('Lab.count') do
      post duplicate_admin_course_lab_url(courses(:intro_to_jackassery), courses(:intro_to_jackassery).labs.first)
    end

    assert_equal assigns(:orig_lab).title, assigns(:lab).title
    assert_equal assigns(:orig_lab).requirements.size, assigns(:lab).requirements.size
    assert_equal assigns(:orig_lab).extras.size, assigns(:lab).extras.size

    assert_redirected_to admin_course_lab_path(assigns(:course),assigns(:lab))
  end

  test "should_show_lab" do
    get admin_course_lab_url(courses(:intro_to_jackassery),labs(:hello_world))
    assert_response :success
  end

  test "should_get_edit" do
    get edit_admin_course_lab_url(courses(:intro_to_jackassery),labs(:hello_world))
    assert_response :success
  end

  test "should_update_lab" do
    put admin_course_lab_url(courses(:intro_to_jackassery),labs(:hello_world)),
      params: {
        lab: {
          visible: "true",
          allow_uploads: "true",
          title: 'Hello, World!',
          objective: 'Setup stuff and make it work',
          instructions: 'do a great many things that will be very interesting'
        }
    }
    assert_redirected_to admin_course_lab_path(assigns(:course),assigns(:lab))
  end

  test "should_destroy_lab" do
    assert_difference('Lab.count', -1) do
      delete admin_course_lab_url(courses(:intro_to_jackassery),labs(:hello_world))
    end

    assert_redirected_to admin_course_labs_path(assigns(:course))
  end
end
