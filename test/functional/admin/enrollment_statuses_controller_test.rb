require 'test_helper'

class Admin::EnrollmentStatusesControllerTest < ActionController::TestCase
  cannot_access_actions( {:index => :get, :new => :get, :create => :post, :edit => :get, :update => :post, :destroy => :delete} )
  
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
  
  def test_should_create_enrollment_status
    assert_difference('EnrollmentStatus.count') do
      post :create,
      :enrollment_status => { 
        :name => 'Withdrawn'
      }
    end
  
    assert_redirected_to admin_enrollment_statuses_path
  end
  
  def test_should_get_edit
    get :edit, :id => enrollment_statuses(:enrolled)
    assert_response :success
  end
  
  def test_should_update_enrollment_status
    post :update, :id => enrollment_statuses(:enrolled), :enrollment_status => { :name => 'new name' }
    assert_redirected_to admin_enrollment_statuses_path
  end
  
  def test_should_destroy_enrollment_status
    assert_difference('EnrollmentStatus.count', -1) do
      delete :destroy, :id => enrollment_statuses(:enrolled).id
    end
  
    assert_redirected_to admin_enrollment_statuses_path
  end
end
