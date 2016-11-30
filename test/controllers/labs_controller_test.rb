require 'test_helper'

class LabsControllerTest < ActionDispatch::IntegrationTest
  test "should_show_lab" do
    get course_lab_url(courses(:intro_to_jackassery), labs(:hello_world))
    assert_response :success
  end
end
