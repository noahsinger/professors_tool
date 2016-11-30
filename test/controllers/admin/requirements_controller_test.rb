require 'test_helper'

class Admin::RequirementsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/requirements', {course_id: 1, lab_id: 1},
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
  end

  test "should get new" do
    get new_admin_course_lab_requirement_url(courses(:intro_to_jackassery), lab_id: labs(:hello_world))
    assert_response :success
  end

  test "should create requirement" do
    assert_difference('Requirement.count') do
      post admin_course_lab_requirements_url(courses(:intro_to_jackassery), lab_id: labs(:hello_world)),
        params: {
          requirement: {
            description: "something",
            points: 50
          }
        }
    end

    assert_redirected_to admin_course_lab_path(courses(:intro_to_jackassery),labs(:hello_world))
  end

  test "should get edit" do
    get edit_admin_course_lab_requirement_url(courses(:intro_to_jackassery), labs(:hello_world).id, requirements(:do_well))
    assert_response :success
  end

  test "should update requirement" do
    put admin_course_lab_requirement_url(courses(:intro_to_jackassery), labs(:hello_world).id, requirements(:do_well)),
        params: {requirement: { description: 'blah blah' }}
    assert_redirected_to admin_course_lab_path(courses(:intro_to_jackassery),labs(:hello_world))
  end

  test "should destroy requirement" do
    assert_difference('Requirement.count', -1) do
      delete admin_course_lab_requirement_url(courses(:intro_to_jackassery), labs(:hello_world).id, requirements(:do_well))
    end

    assert_redirected_to admin_course_lab_path(courses(:intro_to_jackassery),labs(:hello_world))
  end
end
