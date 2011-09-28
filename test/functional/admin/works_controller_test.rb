require 'test_helper'

class Admin::WorksControllerTest < ActionController::TestCase
  cannot_access_actions
  
  def setup
    login_as(:admin)
    
   xxx@xxx.xxx = sections(:jck1003_section_1)
    @semester xxx@xxx.xxx
    @assignment xxx@xxx.xxx
  end
  
  test "should get index" do
    get :index, :section_id => @section, :semester_id => @semester, :assignment_id xxx@xxx.xxx
    assert_response :success
    assert_not_nil assigns(:works)
  end

  test "should get new" do
    get :new, :section_id => @section, :semester_id => @semester, :assignment_id xxx@xxx.xxx
    assert_response :success
  end
  
  test "should get new for all" do
    get :new_for_all, :section_id => @section, :semester_id => @semester, :assignment_id xxx@xxx.xxx

   xxx@xxx.xxx do |e|
      assert_not_nil e.works.find( :first, :conditions => ['assignment_id = xxx@xxx.xxx )
    end
    
    assert_redirected_to xxx@xxx.xxx
  end
  
  test "should create work" do
    assert_difference('Work.count') do
      post :create, :section_id => @section, :semester_id => @semester, :assignment_id xxx@xxx.xxx 
      :work => { 
        :enrollment_id => enrollments(:stews_enrollment),
        :email => students(:stew).email,
        :upload => fixture_file_upload('files/file.zip', 'application/zip')
      }
    end
  
    assert_redirected_to xxx@xxx.xxx
  end
  
  test "should show work" do
    get :show, :id => works(:pues_lab1), :section_id => @section, :semester_id => @semester, :assignment_id xxx@xxx.xxx
    assert_response :success
  end
  
  test "should get edit" do
    get :edit, :id => works(:pues_lab1), :section_id => @section, :semester_id => @semester, :assignment_id xxx@xxx.xxx
    assert_response :success
  end
  
  test "should update work" do
    put :update, :id => works(:pues_lab1), :section_id => @section, :semester_id => @semester, :assignment_id xxx@xxx.xxx
        :work => { :enrollment_id => enrollments(:pues_enrollment) }
    assert_redirected_to admin_semester_section_assignment_work_path(assigns(:semester),assigns(:section),assigns(:assignment),assigns(:work))
  end
  
  test "should destroy work" do
    assert_difference('Work.count', -1) do
      delete :destroy, :id => works(:pues_lab1), :section_id => @section, :semester_id => @semester, :assignment_id xxx@xxx.xxx
    end
  
    assert_redirected_to xxx@xxx.xxx @section, @assignment )
  end
  
  test "should get grade" do
    get :grade, :id => works(:pues_lab1), :section_id => @section, :semester_id => @semester, :assignment_id xxx@xxx.xxx
    assert_response :success
    assert_not_nil assigns(:work)
  end
  
  test "should destroy grade" do
    delete :destroy_grade, :id => works(:pues_lab1), :section_id => @section, :semester_id => @semester, :assignment_id xxx@xxx.xxx
    assert_not_nil assigns(:work)
    assert_equal 0, assigns(:work).awarded_points.size
    assert_equal "", assigns(:work).instructors_comments

    assert_redirected_to xxx@xxx.xxx @section, @assignment )
  end
  
  test "should record score" do
    post :record_score, :id => works(:pues_lab1), :section_id => @section, :semester_id => @semester, :assignment_id xxx@xxx.xxx
          :work => {}, :awarded_points xxx@xxx.xxx {|req| [req.id,req.points]}

    assert_not_nil assigns(:work)
    assigns(:work).reload
    xxx@xxx.xxx assigns(:work).awarded_points.size
    xxx@xxx.xxx assigns(:work).score
    
    assert_redirected_to xxx@xxx.xxx @section, @assignment )
  end
end
