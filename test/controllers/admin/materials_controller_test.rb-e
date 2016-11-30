require 'test_helper'

class Admin::MaterialsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/materials', {course_id: 1},
                        {action: 'index'}    => :get,
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'show', id: 1}     => :get,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
  end

  test "should get index" do
    get admin_course_materials_url(courses(:intro_to_jackassery))
    assert_response :success
  end

  test "should get show" do
    get admin_course_material_url(courses(:intro_to_jackassery),materials(:one))
    assert_response :success
  end

  test "should get new" do
    get new_admin_course_material_url(courses(:intro_to_jackassery))
    assert_response :success
  end

  test "should create material" do
    assert_difference('Material.count') do
      post admin_course_materials_url(courses(:intro_to_jackassery)),
        params: {
          material: {
            title: 'Something',
            description: "something",
            file: fixture_file_upload('test/fixtures/files/file.zip', 'application/zip')
          }
        }
    end

    assert_redirected_to admin_course_materials_path(courses(:intro_to_jackassery))
  end

  test "should get edit" do
    get edit_admin_course_material_url(courses(:intro_to_jackassery),materials(:one))
    assert_response :success
  end

  test "should update material" do
    put admin_course_material_url(courses(:intro_to_jackassery),materials(:one)),
        params: {material: { description: 'blah blah' }}
    assert_redirected_to admin_course_materials_path(courses(:intro_to_jackassery))
  end

  test "should destroy material" do
    assert_difference('Material.count', -1) do
      delete admin_course_material_url(courses(:intro_to_jackassery),materials(:one))
    end

    assert_redirected_to admin_course_materials_path(courses(:intro_to_jackassery))
  end
end
