require 'test_helper'

class Admin::ObjectivesControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/objectives', {course_id: 1},
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
    get admin_course_objectives_url(courses(:intro_to_jackassery))
    assert_response :success
  end

  test "should get new" do
    get new_admin_course_objective_url(courses(:intro_to_jackassery))
    assert_response :success
  end

  test "should create objective" do
    assert_difference('Objective.count') do
      post admin_course_objectives_url(courses(:intro_to_jackassery)),
        params: {
          objective: {
            description: "something"
          }
        }
    end

    assert_redirected_to admin_course_objectives_path(courses(:intro_to_jackassery))
  end

  test "should get edit" do
    get edit_admin_course_objective_url(courses(:intro_to_jackassery),objectives(:one))
    assert_response :success
  end

  test "should update objective" do
    put admin_course_objective_url(courses(:intro_to_jackassery),objectives(:one)),
        params: {objective: { description: 'blah blah' }}
    assert_redirected_to admin_course_objectives_path(courses(:intro_to_jackassery))
  end

  test "should destroy objective" do
    assert_difference('Objective.count', -1) do
      delete admin_course_objective_url(courses(:intro_to_jackassery),objectives(:one))
    end

    assert_redirected_to admin_course_objectives_path(courses(:intro_to_jackassery))
  end
end
