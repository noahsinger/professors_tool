require 'test_helper'

class Admin::WorksControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/works', {semester_id: 1, section_id: 1, assignment_id: 1},
                        {action: 'index'}                 => :get,
                        {action: 'new'}                   => :get,
                        {action: 'create'}                => :post,
                        {action: 'show', id: 1}           => :get,
                        {action: 'edit', id: 1}           => :get,
                        {action: 'update', id: 1}         => :put,
                        {action: 'destroy', id: 1}        => :delete,
                        {action: 'grade', id: 1}          => :get,
                        {action: 'destroy_grade', id: 1}  => :delete,
                        {action: 'record_score', id: 1}   => :put,
                        {action: 'new_for_all'}           => :get)

  def setup
    login_as(:admin)

    @section = sections(:jck1003_section_1)
    @semester = @section.semester
    @assignment = @section.assignments.find(2)
  end

  test "should get index" do
    get admin_semester_section_assignment_works_url(@semester,@section,@assignment)
    assert_response :success
    assert_not_nil assigns(:works)
  end

  test "should get new" do
    get new_admin_semester_section_assignment_work_url(@semester,@section,@assignment)
    assert_response :success
  end

  test "should get new for all" do
    get new_for_all_admin_semester_section_assignment_works_url(@semester,@section,@assignment)

    @section.enrollments.each do |e|
      assert_not_nil e.works.where(['assignment_id = ?', @assignment.id]).first
    end

    assert_redirected_to admin_semester_section_assignment_works_url(@semester,@section,@assignment)
  end

  test "should create work" do
    assert_difference('Work.count') do
      post admin_semester_section_assignment_works_url(@semester,@section,@assignment),
        params: {
          work: {
            enrollment_id: enrollments(:stews_enrollment).id,
            email: students(:stew).email,
            upload: fixture_file_upload('test/fixtures/files/file.zip', 'application/zip')
          }
        }
    end

    assert_redirected_to admin_semester_section_assignment_works_url(@semester,@section,@assignment)
  end

  test "should show work" do
    get admin_semester_section_assignment_work_url(@semester,@section,@assignment,works(:pues_lab1))
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_semester_section_assignment_work_url(@semester,@section,@assignment,works(:pues_lab1))
    assert_response :success
  end

  test "should update work" do
    put admin_semester_section_assignment_work_url(@semester,@section,@assignment,works(:pues_lab1)),
      params: {work: { enrollment_id: enrollments(:pues_enrollment) }}
    assert_redirected_to admin_semester_section_assignment_work_path(assigns(:semester),assigns(:section),assigns(:assignment),assigns(:work))
  end

  test "should destroy work" do
    assert_difference('Work.count', -1) do
      delete admin_semester_section_assignment_work_url(@semester,@section,@assignment,works(:pues_lab1))
    end

    assert_redirected_to admin_semester_section_assignment_works_url( @semester, @section, @assignment )
  end

  test "should get grade" do
    get grade_admin_semester_section_assignment_work_url(@semester,@section,@assignment,works(:pues_lab1))
    assert_response :success
    assert_not_nil assigns(:work)
  end

  test "should destroy grade" do
    delete destroy_grade_admin_semester_section_assignment_work_url(@semester,@section,@assignment,works(:pues_lab1))
    assert_not_nil assigns(:work)
    assert_equal 0, assigns(:work).awarded_points.size
    assert_equal "", assigns(:work).instructors_comments

    assert_redirected_to admin_semester_section_assignment_works_url( @semester, @section, @assignment )
  end

  test "should record score" do
    put record_score_admin_semester_section_assignment_work_url(@semester,@section,@assignment,works(:pues_lab1)),
      params: {work: {email: works(:pues_lab1).email}, awarded_points: @assignment.lab.requirements.inject({}) {|hash, req| hash[req.id] = req.points; hash}}

    assert_not_nil assigns(:work)
    assigns(:work).reload
    assert_equal @assignment.lab.requirements.size, assigns(:work).awarded_points.size
    assert_equal @assignment.worth, assigns(:work).score

    assert_redirected_to admin_semester_section_assignment_works_url( @semester, @section, @assignment )
  end
end
