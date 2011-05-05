# require 'test_helper'
# 
# class AwardedPointsControllerTest < ActionController::TestCase
#   def test_should_get_index
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:awarded_points)
#   end
# 
#   def test_should_get_new
#     get :new
#     assert_response :success
#   end
# 
#   def test_should_create_awarded_point
#     assert_difference('AwardedPoint.count') do
#       post :create, :awarded_point => { }
#     end
# 
#     assert_redirected_to awarded_point_path(assigns(:awarded_point))
#   end
# 
#   def test_should_show_awarded_point
#     get :show, :id => awarded_points(:one).id
#     assert_response :success
#   end
# 
#   def test_should_get_edit
#     get :edit, :id => awarded_points(:one).id
#     assert_response :success
#   end
# 
#   def test_should_update_awarded_point
#     put :update, :id => awarded_points(:one).id, :awarded_point => { }
#     assert_redirected_to awarded_point_path(assigns(:awarded_point))
#   end
# 
#   def test_should_destroy_awarded_point
#     assert_difference('AwardedPoint.count', -1) do
#       delete :destroy, :id => awarded_points(:one).id
#     end
# 
#     assert_redirected_to awarded_points_path
#   end
# end
