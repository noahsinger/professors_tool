require 'test_helper'

class InstructorsControllerTest < ActionController::TestCase
  def test_should_show_instructor
    get :show, :id => instructors(:me).id
    assert_response :success
  end
end
