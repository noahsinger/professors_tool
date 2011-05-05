require 'test_helper'

class Admin::InstructorsControllerTest < ActionController::TestCase
  def test_should_not_get_index_when_not_logged_in
    get :index
    assert_response :redirect
    assert_redirected_to signin_admin_admin_path
  end
  
  def test_should_get_index
    login_as(:admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:instructors)
  end

  def test_should_get_new
    login_as(:admin)
    get :new
    assert_response :success
  end

  def test_should_create_instructor
    login_as(:admin)
    assert_difference('Instructor.count') do
      post :create, :instructor => { :first_name => 'test',
                                     :last_name => 'test',
                                     :phone_number => '9185555555',
                                     :email => xxx@xxx.xxx
                                     :division_id => divisions(:bit).id }
    end

    assert_redirected_to admin_instructor_path(assigns(:instructor))
  end

  def test_should_show_instructor
    login_as(:admin)
    get :show, :id => instructors(:me).id
    assert_response :success
  end

  def test_should_get_edit
    login_as(:admin)
    get :edit, :id => instructors(:me).id
    assert_response :success
  end

  def test_should_update_instructor
    login_as(:admin)
    put :update, :id => instructors(:me).id, :instructor => { :first_name => 'Victrola' }
    assert_redirected_to admin_instructor_path(assigns(:instructor))
  end

  def test_should_destroy_instructor
    login_as(:admin)
    assert_difference('Instructor.count', -1) do
      delete :destroy, :id => instructors(:me).id
    end

    assert_redirected_to admin_instructors_path
  end
end
