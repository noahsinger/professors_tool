require 'test_helper'

class Admin::CoursesControllerTest < ActionController::TestCase
  cannot_access_actions
  
  def setup
    login_as(:admin)
  end
  
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_course
    assert_difference('Course.count') do
      post :create, :course => { 
                    :title => "Introduction to Jackassery",
                    :description => "This course is an introduction to...",
                    :discipline => "JCK",
                    :number => "1003",
                    :credits => "3"
                   }
    end

    assert_redirected_to admin_course_path(assigns(:course))
  end

  def test_should_show_course
    get :show, :id => courses(:intro_to_jackassery).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => courses(:intro_to_jackassery).id
    assert_response :success
  end

  def test_should_update_course
    put :update, :id => courses(:intro_to_jackassery).id, :course => { :credits => "2" }
    assert_redirected_to admin_course_path(assigns(:course))
  end

  def test_should_destroy_course
    assert_difference('Course.count', -1) do
      delete :destroy, :id => courses(:intro_to_jackassery).id
    end

    assert_redirected_to admin_courses_path
  end
end
