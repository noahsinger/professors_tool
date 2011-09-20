require 'test_helper'

class GradeRequestsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new, :semester_id => Semester.current, :section_id => Semester.current.sections.first
    assert_response :success
  end

  test "should create grade_request for enrolled student" do
    sections(:jck1003_section_1).enrollments.build( :student => students(:stew) ).save
    
    # assert_difference('ActionMailer::Base.deliveries.size') do
    assert_difference('Delayed::Job.all.size') do
      assert_difference('GradeRequest.count') do
        post :create, :grade_request => { :email => sections(:jck1003_section_1).enrollments.first.student.email }, 
        		 					:semester_id => sections(:jck1003_section_1).semester.id, 
        		 					:section_id => sections(:jck1003_section_1).id
      end
    end
    
    assert_equal 'sent', assigns(:grade_request).status
    assert_redirected_to semester_section_assignments_url(sections(:jck1003_section_1).semester, sections(:jck1003_section_1))
  end
  
  test "should not create grade_request for non-enrolled student" do
    assert_no_difference('Delayed::Job.all.size') do
      assert_difference('GradeRequest.count') do
        post :create, :grade_request => { :email => xxx@xxx.xxx }, 
        		 					:semester_id => sections(:jck1003_section_1).semester.id, 
        		 					:section_id => sections(:jck1003_section_1).id
      end
    end
    
    assert_equal 'denied', GradeRequest.last.status
    assert_response :success
  end
  
  test "should not send 2 grade_requests in under 10 minutes" do
    sections(:jck1003_section_1).enrollments.build( :student => students(:stew) ).save
    
    assert_difference('Delayed::Job.all.size') do
      2.times do
        assert_difference('GradeRequest.count') do
          post :create, :grade_request => { :email => sections(:jck1003_section_1).enrollments.first.student.email }, 
          		 					:semester_id => sections(:jck1003_section_1).semester.id, 
          		 					:section_id => sections(:jck1003_section_1).id
        end
      end
    end
    
    assert_equal 'denied', GradeRequest.last.status
    assert_response :success
  end
end


