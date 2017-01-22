require 'test_helper'

class Admin::StepsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/steps', {how_to_id: 1},
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'show', id: 1}     => :get,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete,
                        {action: 'sort'}            => :post)

  def setup
    login_as(:admin)
  end

  test "should get new" do
    get new_admin_how_to_step_path(how_tos(:one), course_id: courses(:intro_to_jackassery).id)
    assert_response :success
  end

  test "should create step" do
    assert_difference('Step.count') do
      post admin_how_to_steps_path(how_tos(:one)),
        params: {
          course_id: courses(:intro_to_jackassery).id,
          step: {
            title: 'Something',
            instructions: "something",
            image: fixture_file_upload('test/fixtures/files/rails.png', 'images/png')
          }
        }
    end

    assert_redirected_to admin_how_to_step_path(assigns(:how_to), assigns(:step), course_id: assigns(:course))
  end

  test "should show step" do
    get admin_how_to_step_path(how_tos(:one), steps(:one), course_id: courses(:intro_to_jackassery).id)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_how_to_step_path(how_tos(:one), steps(:one), course_id: courses(:intro_to_jackassery).id)
    assert_response :success
  end

  test "should update step" do
    put admin_how_to_step_path(how_tos(:one), steps(:one)),
        params: {
          course_id: courses(:intro_to_jackassery).id,
          step: { 
            title: 'blah blah' 
          }
        }
    assert_redirected_to admin_how_to_step_path(assigns(:how_to), assigns(:step), course_id: assigns(:course))
  end

  test "should destroy step" do
    assert_difference('Step.count', -1) do
      delete admin_how_to_step_path(how_tos(:one), steps(:one), course_id: courses(:intro_to_jackassery).id)
    end

    assert_redirected_to admin_how_to_steps_path(assigns(:how_to), course_id: assigns(:course))
  end

  test "should sort steps" do
    post sort_admin_how_to_steps_path(how_tos(:one)), params: {steps: [2,1], course_id: courses(:intro_to_jackassery).id}
    assert_response :success

    assert_equal [1,2], assigns(:how_to).steps.map {|s| s.position}
  end
end
