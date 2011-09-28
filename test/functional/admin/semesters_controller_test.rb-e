require 'test_helper'

class Admin::SemestersControllerTest < ActionController::TestCase  
  cannot_access_actions
  
  def setup
    login_as(:admin)
  end
  
  def test_should_get_index_when_logged_in
    get :index
    assert_response :success
    assert_not_nil assigns(:semesters)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_semester
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
    get :show, :id => semesters(:fall).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => semesters(:fall).id
    assert_response :success
  end

  def test_should_update_semester
    put :update, :id => semesters(:fall).id, :semester => { }
    assert_redirected_to admin_semester_path(assigns(:semester))
  end

  def test_should_destroy_semester
    assert_difference('Semester.count', -1) do
      delete :destroy, :id => semesters(:fall).id
    end

    assert_redirected_to admin_semesters_path
  end
end
