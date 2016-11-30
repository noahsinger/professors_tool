require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should_get_index" do
    get courses_url
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should_show_course" do
    get course_url(courses(:intro_to_jackassery))
    assert_response :success
  end

  test "should get syllabus" do
    get syllabus_course_url(courses(:intro_to_jackassery))
    assert_response :success
  end
end
