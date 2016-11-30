require 'test_helper'

class Admin::CoursesControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/courses', {},
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
    get admin_courses_url
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should_get_new" do
    get new_admin_course_url
    assert_response :success
  end

  test "should_create_course" do
    assert_difference('Course.count') do
      post admin_courses_url,
        params: {
          course: {
            title: "Introduction to Jackassery",
            description: "This course is an introduction to...",
            discipline: "JCK",
            number: "1003",
            credits: "3"
           }
         }
    end

    assert_redirected_to admin_course_path(assigns(:course))
  end

  test "should_show_course" do
    get admin_course_url(courses(:intro_to_jackassery))
    assert_response :success
  end

  test "should_get_edit" do
    get edit_admin_course_url(courses(:intro_to_jackassery))
    assert_response :success
  end

  test "should_update_course" do
    put admin_course_url(courses(:intro_to_jackassery)), params: {course: { credits: "2" }}
    assert_redirected_to admin_course_path(assigns(:course))
  end

  test "should_destroy_course" do
    assert_difference('Course.count', -1) do
      delete admin_course_url(courses(:intro_to_jackassery))
    end

    assert_redirected_to admin_courses_path
  end
end
