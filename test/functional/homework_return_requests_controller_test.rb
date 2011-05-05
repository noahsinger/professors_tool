# require 'test_helper'
# 
# class HomeworkReturnRequestsControllerTest < ActionController::TestCase
#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:homework_return_requests)
#   end
# 
#   test "should get new" do
#     get :new
#     assert_response :success
#   end
# 
#   test "should create homework_return_request" do
#     assert_difference('HomeworkReturnRequest.count') do
#       post :create, :homework_return_request => { }
#     end
# 
#     assert_redirected_to homework_return_request_path(assigns(:homework_return_request))
#   end
# 
#   test "should show homework_return_request" do
#     get :show, :id => homework_return_requests(:one).id
#     assert_response :success
#   end
# 
#   test "should get edit" do
#     get :edit, :id => homework_return_requests(:one).id
#     assert_response :success
#   end
# 
#   test "should update homework_return_request" do
#     put :update, :id => homework_return_requests(:one).id, :homework_return_request => { }
#     assert_redirected_to homework_return_request_path(assigns(:homework_return_request))
#   end
# 
#   test "should destroy homework_return_request" do
#     assert_difference('HomeworkReturnRequest.count', -1) do
#       delete :destroy, :id => homework_return_requests(:one).id
#     end
# 
#     assert_redirected_to homework_return_requests_path
#   end
# end
