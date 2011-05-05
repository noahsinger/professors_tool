# require 'test_helper'
# 
# class SyllabusPartsControllerTest < ActionController::TestCase
#   def test_should_get_index
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:syllabus_parts)
#   end
# 
#   def test_should_get_new
#     get :new
#     assert_response :success
#   end
# 
#   def test_should_create_syllabus_part
#     assert_difference('SyllabusPart.count') do
#       post :create, :syllabus_part => { }
#     end
# 
#     assert_redirected_to syllabus_part_path(assigns(:syllabus_part))
#   end
# 
#   def test_should_show_syllabus_part
#     get :show, :id => syllabus_parts(:one).id
#     assert_response :success
#   end
# 
#   def test_should_get_edit
#     get :edit, :id => syllabus_parts(:one).id
#     assert_response :success
#   end
# 
#   def test_should_update_syllabus_part
#     put :update, :id => syllabus_parts(:one).id, :syllabus_part => { }
#     assert_redirected_to syllabus_part_path(assigns(:syllabus_part))
#   end
# 
#   def test_should_destroy_syllabus_part
#     assert_difference('SyllabusPart.count', -1) do
#       delete :destroy, :id => syllabus_parts(:one).id
#     end
# 
#     assert_redirected_to syllabus_parts_path
#   end
# end
