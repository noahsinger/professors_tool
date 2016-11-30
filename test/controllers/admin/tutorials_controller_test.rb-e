require 'test_helper'

class Admin::TutorialsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/tutorials', {course_id: 1},
                        {action: 'index'}           => :get,
                        {action: 'destroy', id: 1}  => :delete,
                        {action: 'sort'}            => :post,
                        {action: 'add_how_to'}      => :post)

  def setup
    login_as(:admin)
  end

  test "should get index" do
    get admin_course_tutorials_url(courses(:intro_to_jackassery))
    assert_response :success
    assert_not_nil assigns(:tutorials)
  end

  test "should destroy tutorial" do
    assert_difference('Tutorial.count', -1) do
      delete admin_course_tutorial_url(courses(:intro_to_jackassery), tutorials(:one))
    end

    assert_redirected_to admin_course_tutorials_path(assigns(:course))
  end

  test "should sort tutorials" do
    post sort_admin_course_tutorials_url(courses(:intro_to_jackassery)), params: {tutorials: [2,1]}
    assert_response :success

    assert_equal [1,2], assigns(:course).tutorials.map {|t| t.position}
  end

  test "should add a how to" do
    assert_difference('Tutorial.count') do
      post add_how_to_admin_course_tutorials_url(courses(:intro_to_jackassery)),
        params: {how_to_id: how_tos(:one).id}
    end

    assert_not_nil assigns(:tutorial)
    assert_equal courses(:intro_to_jackassery).id, assigns(:tutorial).course_id
    assert_equal how_tos(:one).id, assigns(:tutorial).how_to_id

    assert_response :success
  end
end
