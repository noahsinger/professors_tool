require 'test_helper'

class HowTosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index, :course_id => courses(:intro_to_jackassery).id
    assert_response :success
    assert_not_nil assigns(:how_tos)
  end

  def test_should_show_how_to
    get :show, :course_id => courses(:intro_to_jackassery).id, :id => how_tos(:one).id
    assert_response :success
  end
end
