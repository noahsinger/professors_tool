require 'test_helper'

class Admin::AssignmentsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/assignments', {semester_id: 1, section_id: 1},
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

  test "should_get_index" do
    get admin_semester_section_assignments_url(sections(:jck1003_section_1).semester, sections(:jck1003_section_1))
    assert_response :success
    assert_not_nil assigns(:assignments)
  end

  test "should_get_new" do
    get new_admin_semester_section_assignment_url(sections(:jck1003_section_1).semester, sections(:jck1003_section_1))
    assert_response :success
  end

  test "should_create_assignment" do
    Shortly::Clients::Bitly.expects(:shorten).returns(stub(url: "http://fake.url"))

    assert_difference('Assignment.count') do
      post admin_semester_section_assignments_url(sections(:jck1003_section_1).semester, sections(:jck1003_section_1)),
      params: {
        assignment: {
          title: 'Lab999',
          duedate: 2.weeks.from_now,
          lab_id: 2
        }
      }
    end

    assert_redirected_to new_admin_assignment_tweet_path(assignment_id: assigns(:assignment), status: 'new')
  end

  test "should_show_assignment" do
    get admin_semester_section_assignment_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1),assignments(:lab01))
    assert_response :success
  end

  test "should_get_edit" do
    get edit_admin_semester_section_assignment_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1),assignments(:lab01))
    assert_response :success
  end

  test "should update assignment" do
    patch admin_semester_section_assignment_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1),assignments(:lab01)),
      params: {
        assignment: { title: 'Lab777' }
      }
    assert_redirected_to admin_semester_section_assignment_path(assigns(:semester),assigns(:section),assigns(:assignment))
  end

  test "should update assignment and tweet" do
    patch admin_semester_section_assignment_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1),assignments(:lab01)),
      params: {
        assignment: { duedate: '2022-03-09 23:59:00 -0600' }
      }
    assert_redirected_to new_admin_assignment_tweet_path(assignment_id: assigns(:assignment), status: "duedate")
  end


  test "should_destroy_assignment" do
    assert_difference('Assignment.count', -1) do
      delete admin_semester_section_assignment_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1),assignments(:lab01))
    end

    assert_redirected_to admin_semester_section_assignments_path(assigns(:semester),assigns(:section))
  end
end
