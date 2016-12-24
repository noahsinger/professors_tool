require 'test_helper'

class Admin::ExamplesControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/examples', {semester_id: 1, section_id: 1},
                        {action: 'index'}    => :get,
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
  end

  test "should get index" do
    get admin_semester_section_examples_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1))
    assert_response :success
    assert_not_nil assigns(:examples)
  end

  test "should get new" do
    get new_admin_semester_section_example_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1))
    assert_response :success
  end

  test "should create example" do
    assert_difference('Example.count') do
      post admin_semester_section_examples_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1)),
        params: {
          example: {
            name: 'Something',
            description: "something",
            file: fixture_file_upload('test/fixtures/files/file.zip', 'application/zip')
          }
        }
    end

    assert_redirected_to admin_semester_section_examples_path(assigns(:semester),assigns(:section))
  end

  test "should get edit" do
    get edit_admin_semester_section_example_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1),examples(:one))
    assert_response :success
  end

  test "should update example" do
    put admin_semester_section_example_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1),examples(:one)),
      params: {
        example: {
          name: 'Something else',
          description: "something",
          file: fixture_file_upload('test/fixtures/files/file.zip', 'application/zip')
        }
      }
    assert_redirected_to admin_semester_section_examples_path(assigns(:semester),assigns(:section))
  end

  test "should destroy example" do
    assert_difference('Example.count', -1) do
      delete admin_semester_section_example_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1),examples(:one))
    end

    assert_redirected_to admin_semester_section_examples_path(assigns(:semester),assigns(:section))
  end
end
