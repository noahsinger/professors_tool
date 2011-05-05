# require 'test_helper'
# 
# class TutorialsControllerTest < ActionController::TestCase
#   def test_should_get_index
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:tutorials)
#   end
# 
#   def test_should_get_new
#     get :new
#     assert_response :success
#   end
# 
#   def test_should_create_tutorial
#     assert_difference('Tutorial.count') do
#       post :create, :tutorial => { }
#     end
# 
#     assert_redirected_to tutorial_path(assigns(:tutorial))
#   end
# 
#   def test_should_show_tutorial
#     get :show, :id => tutorials(:one).id
#     assert_response :success
#   end
# 
#   def test_should_get_edit
#     get :edit, :id => tutorials(:one).id
#     assert_response :success
#   end
# 
#   def test_should_update_tutorial
#     put :update, :id => tutorials(:one).id, :tutorial => { }
#     assert_redirected_to tutorial_path(assigns(:tutorial))
#   end
# 
#   def test_should_destroy_tutorial
#     assert_difference('Tutorial.count', -1) do
#       delete :destroy, :id => tutorials(:one).id
#     end
# 
#     assert_redirected_to tutorials_path
#   end
# end
