require 'test_helper'

class StepsControllerTest < ActionController::TestCase
  def setup
   xxx@xxx.xxx = steps(:one)
    @how_to xxx@xxx.xxx
    @course xxx@xxx.xxx
  end
  
  def test_should_show_step
    get :show, :id => @step.id, :course_id => @course.id, :how_to_id xxx@xxx.xxx
    assert_response :success
  end
end
