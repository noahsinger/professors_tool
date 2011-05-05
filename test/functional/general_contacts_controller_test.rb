# require 'test_helper'
# 
# class GeneralContactsControllerTest < ActionController::TestCase
#   def test_should_get_index
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:general_contacts)
#   end
# 
#   def test_should_get_new
#     get :new
#     assert_response :success
#   end
# 
#   def test_should_create_general_contact
#     assert_difference('GeneralContact.count') do
#       post :create, :general_contact => { }
#     end
# 
#     assert_redirected_to general_contact_path(assigns(:general_contact))
#   end
# 
#   def test_should_show_general_contact
#     get :show, :id => general_contacts(:one).id
#     assert_response :success
#   end
# 
#   def test_should_get_edit
#     get :edit, :id => general_contacts(:one).id
#     assert_response :success
#   end
# 
#   def test_should_update_general_contact
#     put :update, :id => general_contacts(:one).id, :general_contact => { }
#     assert_redirected_to general_contact_path(assigns(:general_contact))
#   end
# 
#   def test_should_destroy_general_contact
#     assert_difference('GeneralContact.count', -1) do
#       delete :destroy, :id => general_contacts(:one).id
#     end
# 
#     assert_redirected_to general_contacts_path
#   end
# end
