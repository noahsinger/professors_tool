require 'test_helper'

class HomeworkReturnRequestsControllerTest < ActionController::TestCase
  def setup
   xxx@xxx.xxx = sections(:jck1003_section_1)
    @semester xxx@xxx.xxx
    @assignment xxx@xxx.xxx
    
   xxx@xxx.xxx = students(:stew)
    @enrollment = @section.enrollments.build( :student xxx@xxx.xxx )
   xxx@xxx.xxx
    
    @work = @assignment.works.build( :enrollment => @enrollment, :email xxx@xxx.xxx )
   xxx@xxx.xxx
  end
  
  test "should get new" do
    get :new, :semester_id => @semester, :section_id => @section, :assignment_id xxx@xxx.xxx
    assert_response :success
  end

  test "should create homework_return_request for enrolled student" do
    # assert_difference('ActionMailer::Base.deliveries.size') do
    assert_difference('Delayed::Job.all.size') do
      assert_difference('HomeworkReturnRequest.count') do
        post :create, :homework_return_request => { :email xxx@xxx.xxx }, 
                      :semester_id xxx@xxx.xxx 
                      :section_id xxx@xxx.xxx
                      :assignment_id xxx@xxx.xxx
      end
    end
    
    assert_equal 'sent', assigns(:homework_return_request).status
    assert_redirected_to xxx@xxx.xxx @section, @assignment)
  end
  
  test "should not create homework_return_request for non-enrolled student" do
    assert_no_difference('Delayed::Job.all.size') do
      post :create, :homework_return_request => { :email => xxx@xxx.xxx }, 
                    :semester_id xxx@xxx.xxx 
                    :section_id xxx@xxx.xxx
                    :assignment_id xxx@xxx.xxx
    end
    
    assert_response :success
  end
  
  test "should not send 2 homework_return_requests in under 10 minutes" do
    assert_difference('Delayed::Job.all.size') do
      2.times do
        assert_difference('HomeworkReturnRequest.count') do
          post :create, :homework_return_request => { :email xxx@xxx.xxx }, 
                        :semester_id xxx@xxx.xxx 
                        :section_id xxx@xxx.xxx
                        :assignment_id xxx@xxx.xxx
          end
        end
    end
    
    assert_equal 'denied', HomeworkReturnRequest.last.status
    assert_response :success
  end
end
