require 'test_helper'

class InstructorsControllerTest < ActionDispatch::IntegrationTest
  test "should_show_instructor" do
    get instructor_url(instructors(:me))
    assert_response :success
  end
end
