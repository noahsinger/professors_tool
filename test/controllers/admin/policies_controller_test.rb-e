require 'test_helper'

class Admin::PoliciesControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/policies', {course_id: 1},
                        {action: 'index'}             => :get,
                        {action: 'create'}            => :post,
                        {action: 'destroy', id: 1}    => :delete,
                        {action: 'sort'}              => :post,
                        {action: 'add_syllabus_part'} => :post)

  def setup
    login_as(:admin)
  end

  test "should get index" do
    get admin_course_policies_url(courses(:intro_to_jackassery))
    assert_response :success
  end

  test "should create policy" do
    assert_difference('Policy.count') do
      post admin_course_policies_url(courses(:intro_to_jackassery)),
        params: {
          policy: {
            syllabus_part_id: syllabus_parts(:one)
          }
        }
    end

    assert_redirected_to admin_course_path(courses(:intro_to_jackassery))
  end

  test "should destroy policy" do
    assert_difference('Policy.count', -1) do
      delete admin_course_policy_url(courses(:intro_to_jackassery),policies(:one))
    end

    assert_redirected_to admin_course_policies_path(courses(:intro_to_jackassery))
  end

  test "should sort" do
    post sort_admin_course_policies_url(courses(:intro_to_jackassery)), params: {policies: [2,1]}
    assert_response :success

    assert_equal [1,2], assigns(:course).policies.map {|p| p.position}
  end

  test "should add syllabus part" do
    post add_syllabus_part_admin_course_policies_url(courses(:intro_to_jackassery)),
      params: {syllabus_part_id: syllabus_parts(:one)}
    assert_response :success
  end
end
