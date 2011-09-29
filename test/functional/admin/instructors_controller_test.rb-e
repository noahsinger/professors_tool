require 'test_helper'

class Admin::InstructorsControllerTest < ActionController::TestCase
  cannot_access_actions([:id => 1])
  
  def setup
    login_as(:admin)
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:instructors)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_instructor
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
    get :show, :id => instructors(:me).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => instructors(:me).id
    assert_response :success
  end

  def test_should_update_instructor
    put :update, :id => instructors(:me).id, :instructor => { :first_name => 'Victrola' }
    assert_redirected_to admin_instructor_path(assigns(:instructor))
  end

  def test_should_destroy_instructor
    assert_difference('Instructor.count', -1) do
      delete :destroy, :id => instructors(:me).id
    end

    assert_redirected_to admin_instructors_path
  end
end
