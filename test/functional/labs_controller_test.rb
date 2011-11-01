require 'test_helper'

class LabsControllerTest < ActionController::TestCase
  # def test_should_get_index
  #   get :index, :course_id => courses(:intro_to_jackassery).id
  #   assert_response :success
  #   assert_not_nil assigns(:labs)
  # end

  def test_should_show_lab
    get :show, :course_id => courses(:intro_to_jackassery).id, :id => labs(:hello_world).id
    assert_response :success
  end
end
