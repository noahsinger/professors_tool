require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  def test_should_show_course
    get :show, :id => courses(:intro_to_jackassery).id
    assert_response :success
  end
end
