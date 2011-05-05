# require 'test_helper'
# 
# class RequirementsControllerTest < ActionController::TestCase
#   def test_should_get_index
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:requirements)
#   end
# 
#   def test_should_get_new
#     get :new
#     assert_response :success
#   end
# 
#   def test_should_create_requirement
#     assert_difference('Requirement.count') do
#       post :create, :requirement => { }
#     end
# 
#     assert_redirected_to requirement_path(assigns(:requirement))
#   end
# 
#   def test_should_show_requirement
#     get :show, :id => requirements(:one).id
#     assert_response :success
#   end
# 
#   def test_should_get_edit
#     get :edit, :id => requirements(:one).id
#     assert_response :success
#   end
# 
#   def test_should_update_requirement
#     put :update, :id => requirements(:one).id, :requirement => { }
#     assert_redirected_to requirement_path(assigns(:requirement))
#   end
# 
#   def test_should_destroy_requirement
#     assert_difference('Requirement.count', -1) do
#       delete :destroy, :id => requirements(:one).id
#     end
# 
#     assert_redirected_to requirements_path
#   end
# end
