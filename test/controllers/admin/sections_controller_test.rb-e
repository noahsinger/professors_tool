require 'test_helper'

class Admin::SectionsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/sections', {semester_id: 1},
                        {action: 'index'}    => :get,
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'show', id: 1}     => :get,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete,
                        {action: 'section_email', id: 1}   => :get,
                        {action: 'export_gradebook', id: 1}  => :get)

  def setup
    login_as(:admin)
  end

  test "should_get_index" do
    get admin_semester_sections_url(sections(:jck1003_section_1).semester)
    assert_response :success
    assert_not_nil assigns(:sections)
  end

  test "should_get_new" do
    get new_admin_semester_section_url(sections(:jck1003_section_1).semester)
    assert_response :success
  end

  test "should_create_section" do
    assert_difference('Section.count') do
      post admin_semester_sections_url(sections(:jck1003_section_1).semester),
        params: {
          section: {
            course_id: "1",
            call_number: "12345",
            section_number: "111",
            room_number: "MC000",
            meeting_days: "MW",
            start_time: "8:30am",
            end_time: "9:50am",
            start_date: 5.months.ago,
            end_date: 2.months.ago,
            instructor_id: instructors(:me).id
          }
        }
    end

    assert_redirected_to admin_semester_section_path(assigns(:semester), assigns(:section))
  end

  test "should_show_section" do
    get admin_semester_section_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1))
    assert_response :success
  end

  test "should_get_edit" do
    get edit_admin_semester_section_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1))
    assert_response :success
  end

  test "should_update_section" do
    put admin_semester_section_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1)),
      params: {
        section: {
          course_id: "1",
          call_number: "54321",
          section_number: "111",
          room_number: "MC000",
          meeting_days: "MW",
          start_time: "8:30am",
          end_time: "9:50am",
          start_date: 5.months.ago,
          end_date: 2.months.ago,
          instructor_id: instructors(:me).id
        }
      }

    assert_redirected_to admin_semester_section_path(assigns(:semester), assigns(:section))
  end

  test "should_destroy_section" do
    assert_difference('Section.count', -1) do
      delete admin_semester_section_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1))
    end

    assert_redirected_to admin_semester_sections_path(assigns(:semester))
  end

  test "should show section email page" do
    get section_email_admin_semester_section_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1))
    assert_response :success
  end

  test "should send section email when body included" do
    assert_difference('Delayed::Job.all.size', sections(:jck1003_section_1).enrollments.size) do
      get section_email_admin_semester_section_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1)),
      params: {body: 'this is the body'}
    end

    assert_redirected_to admin_semester_section_path(assigns(:semester), assigns(:section))
  end

  test "should export gradebook" do
    get export_gradebook_admin_semester_section_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1))
    assert_response :success
  end
end
