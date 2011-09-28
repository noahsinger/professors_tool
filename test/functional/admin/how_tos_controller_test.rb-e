require 'test_helper'

class Admin::HowTosControllerTest < ActionController::TestCase
  cannot_access_actions
  
  def setup
    login_as(:admin)
  end

  def test_should_get_index
    get :index
    assert_response :success
  end
  
  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_how_to
    assert_difference('HowTo.count') do
      post :create,
      :how_to => { 
        :title => 'Something',
        :description => 'This something'
      }
    end
  
    assert_redirected_to admin_how_to_path(assigns(:how_to))
  end
  
  def test_should_get_edit
    get :edit, :id => how_tos(:one)
    assert_response :success
  end
  
  def test_should_update_how_to
    post :update, :id => how_tos(:one), :how_to => { :title => 'new title' }
    assert_redirected_to admin_how_to_path(assigns(:how_to))
  end
  
  def test_should_destroy_how_to
    assert_difference('HowTo.count', -1) do
      delete :destroy, :id => how_tos(:one)
    end
  
    assert_redirected_to admin_how_tos_path
  end
end
