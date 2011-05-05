require 'test_helper'

class Admin::SemestersControllerTest < ActionController::TestCase  
  def test_should_not_get_index_when_not_logged_in
    get :index
    assert_response :redirect
    assert_redirected_to signin_admin_admin_path
  end
  
  def test_should_get_index_when_logged_in
    login_as(:admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:semesters)
  end

  def test_should_get_new
    login_as(:admin)
    get :new
    assert_response :success
  end

  def test_should_create_semester
    login_as(:admin)
    assert_difference('Semester.count') do
      post :create, :semester => { :year => "2019",
                                   :season => "Spring",
                                   :start_date => 11.month.from_now,
                                   :end_date => 14.months.from_now
                                 }
    end

    assert_redirected_to admin_semester_path(assigns(:semester))
  end

  def test_should_show_semester
    login_as(:admin)
    get :show, :id => semesters(:fall).id
    assert_response :success
  end

  def test_should_get_edit
    login_as(:admin)
    get :edit, :id => semesters(:fall).id
    assert_response :success
  end

  def test_should_update_semester
    login_as(:admin)
    put :update, :id => semesters(:fall).id, :semester => { }
    assert_redirected_to admin_semester_path(assigns(:semester))
  end

  def test_should_destroy_semester
    login_as(:admin)
    assert_difference('Semester.count', -1) do
      delete :destroy, :id => semesters(:fall).id
    end

    assert_redirected_to admin_semesters_path
  end
end
