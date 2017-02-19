require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper 
  
  def setup
    @section = sections(:jck1003_section_1)
    @semester = @section.semester
    @assignment = @section.assignments.first
    @student = @section.enrollments.first.student
  end

  test "should get new" do
    get new_semester_section_assignment_work_url(@semester, @section, @assignment)
    assert_response :success
  end

  test "should create work" do
    assert_enqueued_jobs 1 do 
      assert_difference('Work.count') do
        post semester_section_assignment_works_url(@semester, @section, @assignment),
          params: {work: {email: @student.email, upload: ''}}
      end
    end

    assert_equal @section.enrollments.first, assigns(:work).enrollment

    assert_redirected_to semester_section_assignment_path(@semester,@section,@assignment)
  end

  test "should not accept work if already submitted" do
    #submit the work once
    post semester_section_assignment_works_url(@semester, @section, @assignment),
      params: {work: {email: @student.email, upload: ''}}

    #submit it again
    assert_enqueued_jobs 1 do #reminder email sent
      assert_no_difference('Work.count') do #no new work created
        post semester_section_assignment_works_url(@semester, @section, @assignment),
          params: {work: {email: @student.email, upload: ''}}
      end
    end

    assert_equal @section.enrollments.first, assigns(:work).enrollment
    assert_response :success
  end

  test "should allow withdraw with correct code" do
    get withdraw_semester_section_assignment_works_url(@semester, @section, @assignment),
      params: {code: works(:pues_lab1).withdrawal_code}
    assert_equal "destroyed", assigns(:condition)
  end

  test "should not allow withdraw without a correct code" do
    get withdraw_semester_section_assignment_works_url(@semester, @section, @assignment)
    assert_equal "no code", assigns(:condition)
  end

  test "should not allow withdraw when assignment is past due" do
    @assignment.update_attribute(:duedate, 1.day.ago)
    get withdraw_semester_section_assignment_works_url(@semester, @section, @assignment),
      params: {code: @assignment.works.first.withdrawal_code}
    assert_equal "pastdue", assigns(:condition)
  end
end
