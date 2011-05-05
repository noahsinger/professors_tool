# require 'test_helper'
# 
# class ExtrasControllerTest < ActionController::TestCase
#   def test_should_get_index
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:extras)
#   end
# 
#   def test_should_get_new
#     get :new
#     assert_response :success
#   end
# 
#   def test_should_create_extra
#     assert_difference('Extra.count') do
#       post :create, :extra => { }
#     end
# 
#     assert_redirected_to extra_path(assigns(:extra))
#   end
# 
#   def test_should_show_extra
#     get :show, :id => extras(:one).id
#     assert_response :success
#   end
# 
#   def test_should_get_edit
#     get :edit, :id => extras(:one).id
#     assert_response :success
#   end
# 
#   def test_should_update_extra
#     put :update, :id => extras(:one).id, :extra => { }
#     assert_redirected_to extra_path(assigns(:extra))
#   end
# 
#   def test_should_destroy_extra
#     assert_difference('Extra.count', -1) do
#       delete :destroy, :id => extras(:one).id
#     end
# 
#     assert_redirected_to extras_path
#   end
# end
