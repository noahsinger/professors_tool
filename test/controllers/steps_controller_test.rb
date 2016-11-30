require 'test_helper'

class StepsControllerTest < ActionDispatch::IntegrationTest
  def setup
   xxx@xxx.xxx = steps(:one)
    @how_to xxx@xxx.xxx
    @course xxx@xxx.xxx
  end

  test "should_show_step" do
    get xxx@xxx.xxx @how_to, @step)
    assert_response :success
  end
end
