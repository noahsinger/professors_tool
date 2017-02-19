require 'test_helper'

class HomeworkReturnRequestsControllerTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper 
  
  def setup
    @section = sections(:jck1003_section_1)
    @semester = @section.semester
    @assignment = @section.assignments.first

    @student = students(:stew)
    @enrollment = @section.enrollments.build( student_id: @student.id )
    @enrollment.save

    @work = @assignment.works.build( enrollment_id: @enrollment.id, email: @student.email )
    @work.save
  end

  test "should get new" do
    get new_semester_section_assignment_homework_return_request_url(@semester, @section, @assignment)
    assert_response :success
  end

  test "should create homework_return_request for enrolled student" do
    assert_enqueued_jobs 1 do 
      assert_difference('HomeworkReturnRequest.count') do
        post semester_section_assignment_homework_return_requests_url(@semester, @section, @assignment),
          params: {homework_return_request: { email: @student.email }}
      end
    end

    assert_equal 'sent', assigns(:homework_return_request).status
    assert_redirected_to semester_section_assignment_url(@semester, @section, @assignment)
  end

  test "should not create homework_return_request for non-enrolled student" do
    assert_enqueued_jobs 0 do 
      post semester_section_assignment_homework_return_requests_url(@semester, @section, @assignment),
        params: {homework_return_request: { email: 'joe@shmo.com' }}
    end

    assert_response :success
  end

  test "should not send 2 homework_return_requests in under 10 minutes" do
    assert_enqueued_jobs 1 do # 1 enqueued job, not 2
      2.times do
        assert_difference('HomeworkReturnRequest.count') do
          post semester_section_assignment_homework_return_requests_url(@semester, @section, @assignment),
            params: {homework_return_request: { email: @student.email }}
          end
        end
    end

    assert_equal 'denied', HomeworkReturnRequest.last.status
    assert_response :success
  end
end
