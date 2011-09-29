require 'test_helper'

class Admin::GeneralContactsControllerTest < ActionController::TestCase
  cannot_access_actions([:id => 1], {:index => :get, :show => :get, :destroy => :delete, :destroy_all => :delete})
  
  def setup
    login_as(:admin)
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should show general contact" do
    get :show, :id => general_contacts(:one)
    assert_response :success
  end
  
  test "should destroy general contact" do
    assert_difference('GeneralContact.count', -1) do
      delete :destroy, :id => general_contacts(:one)
    end
  
    assert_redirected_to admin_general_contacts_path
  end
  
  test "should destroy_all general contacts" do
    delete :destroy_all
    assert_equal 0, GeneralContact.all.size
  
    assert_redirected_to admin_general_contacts_path
  end
end
