# require 'test_helper'
# 
# class MaterialsControllerTest < ActionController::TestCase
#   def test_should_get_index
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:materials)
#   end
# 
#   def test_should_get_new
#     get :new
#     assert_response :success
#   end
# 
#   def test_should_create_material
#     assert_difference('Material.count') do
#       post :create, :material => { }
#     end
# 
#     assert_redirected_to material_path(assigns(:material))
#   end
# 
#   def test_should_show_material
#     get :show, :id => materials(:one).id
#     assert_response :success
#   end
# 
#   def test_should_get_edit
#     get :edit, :id => materials(:one).id
#     assert_response :success
#   end
# 
#   def test_should_update_material
#     put :update, :id => materials(:one).id, :material => { }
#     assert_redirected_to material_path(assigns(:material))
#   end
# 
#   def test_should_destroy_material
#     assert_difference('Material.count', -1) do
#       delete :destroy, :id => materials(:one).id
#     end
# 
#     assert_redirected_to materials_path
#   end
# end
