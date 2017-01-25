require 'test_helper'

class HomeworkReturnRequestsControllerTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper 
  
  def setup
   xxx@xxx.xxx = sections(:jck1003_section_1)
    @semester xxx@xxx.xxx
    @assignment xxx@xxx.xxx

   xxx@xxx.xxx = students(:stew)
    @enrollment = @section.enrollments.build( xxx@xxx.xxx )
   xxx@xxx.xxx

    @work = @assignment.works.build( enrollment_id: @enrollment.id, xxx@xxx.xxx )
   xxx@xxx.xxx
  end

  test "should get new" do
    get xxx@xxx.xxx @section, @assignment)
    assert_response :success
  end

  test "should create homework_return_request for enrolled student" do
    assert_enqueued_jobs 1 do 
      assert_difference('HomeworkReturnRequest.count') do
        post xxx@xxx.xxx @section, @assignment),
          params: {homework_return_request: { xxx@xxx.xxx }}
      end
    end

    assert_equal 'sent', assigns(:homework_return_request).status
    assert_redirected_to xxx@xxx.xxx @section, @assignment)
  end

  test "should not create homework_return_request for non-enrolled student" do
    assert_enqueued_jobs 0 do 
      post xxx@xxx.xxx @section, @assignment),
        params: {homework_return_request: { email: xxx@xxx.xxx }}
    end

    assert_response :success
  end

  test "should not send 2 homework_return_requests in under 10 minutes" do
    assert_enqueued_jobs 1 do # 1 enqueued job, not 2
      2.times do
        assert_difference('HomeworkReturnRequest.count') do
          post xxx@xxx.xxx @section, @assignment),
            params: {homework_return_request: { xxx@xxx.xxx }}
          end
        end
    end

    assert_equal 'denied', HomeworkReturnRequest.last.status
    assert_response :success
  end
end