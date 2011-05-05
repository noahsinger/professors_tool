# require 'test_helper'
# 
# class EnrollmentStatusesControllerTest < ActionController::TestCase
#   def test_should_get_index
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:enrollment_statuses)
#   end
# 
#   def test_should_get_new
#     get :new
#     assert_response :success
#   end
# 
#   def test_should_create_enrollment_status
#     assert_difference('EnrollmentStatus.count') do
#       post :create, :enrollment_status => { }
#     end
# 
#     assert_redirected_to enrollment_status_path(assigns(:enrollment_status))
#   end
# 
#   def test_should_show_enrollment_status
#     get :show, :id => enrollment_statuses(:one).id
#     assert_response :success
#   end
# 
#   def test_should_get_edit
#     get :edit, :id => enrollment_statuses(:one).id
#     assert_response :success
#   end
# 
#   def test_should_update_enrollment_status
#     put :update, :id => enrollment_statuses(:one).id, :enrollment_status => { }
#     assert_redirected_to enrollment_status_path(assigns(:enrollment_status))
#   end
# 
#   def test_should_destroy_enrollment_status
#     assert_difference('EnrollmentStatus.count', -1) do
#       delete :destroy, :id => enrollment_statuses(:one).id
#     end
# 
#     assert_redirected_to enrollment_statuses_path
#   end
# end
