require 'test_helper'

class GradeRequestsControllerTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper 
  
  test "should get new" do
    get new_semester_section_grade_request_url(Semester.current, Semester.current.sections.first)
    assert_response :success
  end

  test "should create grade_request for enrolled student" do
    sections(:jck1003_section_1).enrollments.build( student_id: students(:stew).id ).save

    assert_enqueued_jobs 1 do 
      assert_difference('GradeRequest.count') do
        post semester_section_grade_requests_url(Semester.current, Semester.current.sections.first),
          params: {
            grade_request: {
              email: sections(:jck1003_section_1).enrollments.first.student.email
            }
          }
      end
    end

    assert_equal 'sent', assigns(:grade_request).status
    assert_redirected_to semester_section_assignments_url(sections(:jck1003_section_1).semester, sections(:jck1003_section_1))
  end

  test "should create grade_request for enrolled student if the email has mixed case" do
    sections(:jck1003_section_1).enrollments.build( student_id: students(:stew).id ).save

    assert_enqueued_jobs 1 do 
      assert_difference('GradeRequest.count') do
        post semester_section_grade_requests_url(Semester.current, Semester.current.sections.first),
          params: {
            grade_request: {
              email: sections(:jck1003_section_1).enrollments.first.student.email.upcase
            }
          }
      end
    end

    assert_equal 'sent', assigns(:grade_request).status
    assert_redirected_to semester_section_assignments_url(sections(:jck1003_section_1).semester, sections(:jck1003_section_1))
  end

  test "should not create grade_request for non-enrolled student" do
    assert_enqueued_jobs 0 do 
      assert_difference('GradeRequest.count') do
        post semester_section_grade_requests_url(Semester.current, Semester.current.sections.first),
          params: {
            grade_request: {
              email: xxx@xxx.xxx
            }
          }
      end
    end

    assert_equal 'denied', GradeRequest.last.status
    assert_response :success
  end

  test "should not send 2 grade_requests in under 10 minutes" do
    sections(:jck1003_section_1).enrollments.build( student_id: students(:stew).id ).save

    assert_enqueued_jobs 1 do # 1 enqueued job, not 2
      2.times do
        assert_difference('GradeRequest.count') do
          post semester_section_grade_requests_url(Semester.current, Semester.current.sections.first),
            params: {
              grade_request: {
                email: sections(:jck1003_section_1).enrollments.first.student.email
              }
            }
        end
      end
    end

    assert_equal 'denied', GradeRequest.last.status
    assert_response :success
  end
end
