require 'test_helper'

class Admin::LabsControllerTest < ActionController::TestCase
  cannot_access_actions([:id => 1, :course_id => 2])
  
  def setup
    login_as(:admin)
  end
  
  def test_should_get_index
    get :index, :course_id => courses(:intro_to_jackassery).id
    assert_response :success
    assert_not_nil assigns(:labs)
  end

  def test_should_get_new
    get :new, :course_id => courses(:intro_to_jackassery).id
    assert_response :success
  end

  def test_should_create_lab
    assert_difference('Lab.count') do
      post :create, :course_id => courses(:intro_to_jackassery).id,
      :lab => { 
        :visible => "true",
        :allow_uploads => "true",
        :title => 'Hello, World!',
        :objective => 'Setup stuff and make it work',
        :instructions => 'do a great many things that will be very interesting'        
      }
    end

    assert_redirected_to admin_course_lab_path(assigns(:course),assigns(:lab))
  end

  def test_should_show_lab
    get :show, :id => labs(:hello_world).id, :course_id => courses(:intro_to_jackassery).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => labs(:hello_world).id, :course_id => courses(:intro_to_jackassery).id
    assert_response :success
  end

  def test_should_update_lab
    post :update, :id => labs(:hello_world).id, :course_id => courses(:intro_to_jackassery).id,
    :lab => { 
      :visible => "true",
      :allow_uploads => "true",
      :title => 'Hello, World!',
      :objective => 'Setup stuff and make it work',
      :instructions => 'do a great many things that will be very interesting'
    }

    assert_redirected_to admin_course_lab_path(assigns(:course),assigns(:lab))
  end

  def test_should_destroy_lab
    assert_difference('Lab.count', -1) do
      delete :destroy, :id => labs(:hello_world).id, :course_id => courses(:intro_to_jackassery).id
    end

    assert_redirected_to admin_course_labs_path(assigns(:course))
  end
end
