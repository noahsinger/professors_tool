require 'test_helper'

class Admin::ExtrasControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/extras', {course_id: 1, lab_id: 1},
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
  end

  test "should get new" do
    get new_admin_course_lab_extra_url(courses(:intro_to_jackassery),labs(:hello_world))
    assert_response :success
  end

  test "should create extra" do
    assert_difference('Extra.count') do
      post admin_course_lab_extras_url(courses(:intro_to_jackassery),labs(:hello_world)),
        params: {
          extra: {
            description: "something",
            file: fixture_file_upload('test/fixtures/files/file.zip', 'application/zip')
          }
        }
    end

    assert_redirected_to admin_course_lab_path(courses(:intro_to_jackassery),labs(:hello_world))
  end

  test "should get edit" do
    get edit_admin_course_lab_extra_url(courses(:intro_to_jackassery),labs(:hello_world),extras(:download_1))
    assert_response :success
  end

  test "should update extra" do
    put admin_course_lab_extra_url(courses(:intro_to_jackassery),labs(:hello_world),extras(:download_1)),
      params: {extra: { description: 'blah blah' }}
    assert_redirected_to admin_course_lab_path(courses(:intro_to_jackassery),labs(:hello_world))
  end

  test "should destroy extra" do
    assert_difference('Extra.count', -1) do
      delete admin_course_lab_extra_url(courses(:intro_to_jackassery),labs(:hello_world),extras(:download_1))
    end

    assert_redirected_to admin_course_lab_path(courses(:intro_to_jackassery),labs(:hello_world))
  end
end
