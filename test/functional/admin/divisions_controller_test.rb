require 'test_helper'

class Admin::DivisionsControllerTest < ActionController::TestCase
  def test_should_not_get_index_when_not_logged_in
    get :index
    assert_response :redirect
    assert_redirected_to signin_admin_admin_path
  end

  def test_should_get_index
    login_as(:admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:divisions)
  end

  def test_should_get_new
    login_as(:admin)
    get :new
    assert_response :success
  end

  def test_should_create_division
    login_as(:admin)
    assert_difference('Division.count') do
      post :create, :division => { :name => 'Test Division',
                                   :phone_number => '9185555555',
                                   :office_number => 'xxx212',
                                   :associate_dean => 'Test Dean' }
    end

    assert_redirected_to admin_division_path(assigns(:division))
  end

  def test_should_show_division
    login_as(:admin)
    get :show, :id => divisions(:bit).id
    assert_response :success
  end

  def test_should_get_edit
    login_as(:admin)
    get :edit, :id => divisions(:bit).id
    assert_response :success
  end

  def test_should_update_division
    login_as(:admin)
    put :update, :id => divisions(:bit).id, :division => { :name => 'new test division' }
    assert_redirected_to admin_division_path(assigns(:division))
  end

  def test_should_destroy_division
    login_as(:admin)
    assert_difference('Division.count', -1) do
      delete :destroy, :id => divisions(:bit).id
    end

    assert_redirected_to admin_divisions_path
  end
end
