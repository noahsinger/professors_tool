require 'test_helper'

class Admin::LabsControllerTest < ActionController::TestCase
  def test_should_not_get_index_when_not_logged_in
    get :index, :course_id => courses(:intro_to_jackassery).id
    assert_response :redirect
    assert_redirected_to signin_admin_admin_path
  end
  
  def test_should_get_index
    login_as(:admin)
    get :index, :course_id => courses(:intro_to_jackassery).id
    assert_response :success
    assert_not_nil assigns(:labs)
  end

  def test_should_get_new
    login_as(:admin)
    get :new, :course_id => courses(:intro_to_jackassery).id
    assert_response :success
  end

  def test_should_create_lab
    login_as(:admin)
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

    assert_redirected_to admin_course_path(assigns(:course))
  end

  def test_should_show_lab
    login_as(:admin)
    get :show, :id => labs(:hello_world).id, :course_id => courses(:intro_to_jackassery).id
    assert_response :success
  end

  def test_should_get_edit
    login_as(:admin)
    get :edit, :id => labs(:hello_world).id, :course_id => courses(:intro_to_jackassery).id
    assert_response :success
  end

  def test_should_update_lab
    login_as(:admin)
    post :update, :id => labs(:hello_world).id, :course_id => courses(:intro_to_jackassery).id,
    :lab => { 
      :visible => "true",
      :allow_uploads => "true",
      :title => 'Hello, World!',
      :objective => 'Setup stuff and make it work',
      :instructions => 'do a great many things that will be very interesting'
    }

    assert_redirected_to admin_course_path(assigns(:course))
  end

  def test_should_destroy_lab
    login_as(:admin)
    assert_difference('Lab.count', -1) do
      delete :destroy, :id => labs(:hello_world).id, :course_id => courses(:intro_to_jackassery).id
    end

    assert_redirected_to admin_course_path(assigns(:course))
  end
end
