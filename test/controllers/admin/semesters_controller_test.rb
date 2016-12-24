require 'test_helper'

class Admin::SemestersControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/semesters', {},
                        {action: 'index'}    => :get,
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
  end

  test "should_get_index_when_logged_in" do
    get admin_semesters_url
    assert_response :success
    assert_not_nil assigns(:semesters)
  end

  test "should_get_new" do
    get new_admin_semester_url
    assert_response :success
  end

  test "should_create_semester" do
    assert_difference('Semester.count') do
      post admin_semesters_url,
      params: {
        semester: { year: "2019",
             season: "Spring",
             start_date: 11.month.from_now,
             end_date: 14.months.from_now
           }
         }
    end

    assert_redirected_to admin_semester_sections_path(assigns(:semester))
  end

  test "should_get_edit" do
    get edit_admin_semester_url(semesters(:fall))
    assert_response :success
  end

  test "should_update_semester" do
    put admin_semester_url(semesters(:fall)), params: {semester: { season: 'Spring' }}
    assert_redirected_to admin_semester_sections_path(assigns(:semester))
  end

  test "should_destroy_semester" do
    assert_difference('Semester.count', -1) do
      delete admin_semester_url(semesters(:fall))
    end

    assert_redirected_to admin_semesters_path
  end
end
