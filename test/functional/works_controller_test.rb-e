require 'test_helper'

class WorksControllerTest < ActionController::TestCase  
  def setup
   xxx@xxx.xxx = sections(:jck1003_section_1)
    @semester xxx@xxx.xxx
    @assignment xxx@xxx.xxx
    @student xxx@xxx.xxx
  end
  
  test "should get new" do
    get :new, :semester_id => @semester.id, :section_id => @section.id, :assignment_id xxx@xxx.xxx
    assert_response :success
  end

  test "should create work" do
    assert_difference('Delayed::Job.all.size') do
      assert_difference('Work.count') do
        post :create, :work => {:email => @student.email, :upload => ''}, :semester_id => @semester.id, :section_id => @section.id, :assignment_id xxx@xxx.xxx
      end
    end
    
    xxx@xxx.xxx assigns(:work).enrollment

    assert_redirected_to xxx@xxx.xxx
  end
  
  test "should not accept work if already submitted" do
    #submit the work once
    post :create, :work => {:email => @student.email, :upload => ''}, :semester_id => @semester.id, :section_id => @section.id, :assignment_id xxx@xxx.xxx

    #submit it again
    assert_difference('Delayed::Job.all.size') do #reminder email sent
      assert_no_difference('Work.count') do #no new work created
        post :create, :work => {:email => @student.email, :upload => ''}, :semester_id => @semester.id, :section_id => @section.id, :assignment_id xxx@xxx.xxx
      end
    end
    
    xxx@xxx.xxx assigns(:work).enrollment

    assert_response :success
  end

  test "should allow withdraw with correct code" do
    get :withdraw, :semester_id => @semester.id, :section_id => @section.id, :assignment_id xxx@xxx.xxx :code => works(:pues_lab1).withdrawal_code
    assert_equal "destroyed", assigns(:condition)
  end
  
  test "should not allow withdraw without a correct code" do
    get :withdraw, :semester_id => @semester.id, :section_id => @section.id, :assignment_id xxx@xxx.xxx
    assert_equal "no code", assigns(:condition)
  end
  
  test "should not allow withdraw when assignment is past due" do
   xxx@xxx.xxx 1.day.ago)
    get :withdraw, :semester_id => @semester.id, :section_id => @section.id, :assignment_id => @assignment.id, :code xxx@xxx.xxx
    assert_equal "pastdue", assigns(:condition)
  end
end
