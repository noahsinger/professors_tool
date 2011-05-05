# require 'test_helper'
# 
# class PoliciesControllerTest < ActionController::TestCase
#   def test_should_get_index
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:policies)
#   end
# 
#   def test_should_get_new
#     get :new
#     assert_response :success
#   end
# 
#   def test_should_create_policy
#     assert_difference('Policy.count') do
#       post :create, :policy => { }
#     end
# 
#     assert_redirected_to policy_path(assigns(:policy))
#   end
# 
#   def test_should_show_policy
#     get :show, :id => policies(:one).id
#     assert_response :success
#   end
# 
#   def test_should_get_edit
#     get :edit, :id => policies(:one).id
#     assert_response :success
#   end
# 
#   def test_should_update_policy
#     put :update, :id => policies(:one).id, :policy => { }
#     assert_redirected_to policy_path(assigns(:policy))
#   end
# 
#   def test_should_destroy_policy
#     assert_difference('Policy.count', -1) do
#       delete :destroy, :id => policies(:one).id
#     end
# 
#     assert_redirected_to policies_path
#   end
# end
