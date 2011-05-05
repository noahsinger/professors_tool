require 'test_helper'

class Admin::CoursesControllerTest < ActionController::TestCase
  def test_should_get_index
    login_as(:admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  def test_should_get_new
    login_as(:admin)
    get :new
    assert_response :success
  end

  def test_should_create_course
    login_as(:admin)
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
    login_as(:admin)
    get :show, :id => courses(:intro_to_jackassery).id
    assert_response :success
  end

  def test_should_get_edit
    login_as(:admin)
    get :edit, :id => courses(:intro_to_jackassery).id
    assert_response :success
  end

  def test_should_update_course
    login_as(:admin)
    put :update, :id => courses(:intro_to_jackassery).id, :course => { :credits => "2" }
    assert_redirected_to admin_course_path(assigns(:course))
  end

  def test_should_destroy_course
    login_as(:admin)
    assert_difference('Course.count', -1) do
      delete :destroy, :id => courses(:intro_to_jackassery).id
    end

    assert_redirected_to admin_courses_path
  end
end
