require 'test_helper'

class StepsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @step = steps(:one)
    @how_to = @step.how_to
    @course = @how_to.tutorials.first.course
  end

  test "should_show_step" do
    get course_how_to_step_url(@course, @how_to, @step)
    assert_response :success
  end
end
