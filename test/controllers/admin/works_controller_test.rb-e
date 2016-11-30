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

   xxx@xxx.xxx = sections(:jck1003_section_1)
    @semester xxx@xxx.xxx
    @assignment xxx@xxx.xxx
  end

  test "should get index" do
    get xxx@xxx.xxx
    assert_response :success
    assert_not_nil assigns(:works)
  end

  test "should get new" do
    get xxx@xxx.xxx
    assert_response :success
  end

  test "should get new for all" do
    get xxx@xxx.xxx

   xxx@xxx.xxx do |e|
      assert_not_nil e.works.where(['assignment_id = xxx@xxx.xxx
    end

    assert_redirected_to xxx@xxx.xxx
  end

  test "should create work" do
    assert_difference('Work.count') do
      post xxx@xxx.xxx
        params: {
          work: {
            enrollment_id: enrollments(:stews_enrollment).id,
            email: students(:stew).email,
            upload: fixture_file_upload('test/fixtures/files/file.zip', 'application/zip')
          }
        }
    end

    assert_redirected_to xxx@xxx.xxx
  end

  test "should show work" do
    get xxx@xxx.xxx
    assert_response :success
  end

  test "should get edit" do
    get xxx@xxx.xxx
    assert_response :success
  end

  test "should update work" do
    put xxx@xxx.xxx
      params: {work: { enrollment_id: enrollments(:pues_enrollment) }}
    assert_redirected_to admin_semester_section_assignment_work_path(assigns(:semester),assigns(:section),assigns(:assignment),assigns(:work))
  end

  test "should destroy work" do
    assert_difference('Work.count', -1) do
      delete xxx@xxx.xxx
    end

    assert_redirected_to xxx@xxx.xxx @section, @assignment )
  end

  test "should get grade" do
    get xxx@xxx.xxx
    assert_response :success
    assert_not_nil assigns(:work)
  end

  test "should destroy grade" do
    delete xxx@xxx.xxx
    assert_not_nil assigns(:work)
    assert_equal 0, assigns(:work).awarded_points.size
    assert_equal "", assigns(:work).instructors_comments

    assert_redirected_to xxx@xxx.xxx @section, @assignment )
  end

  test "should record score" do
    put xxx@xxx.xxx
      params: {work: {email: works(:pues_lab1).email}, xxx@xxx.xxx {|hash, req| hash[req.id] = req.points; hash}}

    assert_not_nil assigns(:work)
    assigns(:work).reload
    xxx@xxx.xxx assigns(:work).awarded_points.size
    xxx@xxx.xxx assigns(:work).score

    assert_redirected_to xxx@xxx.xxx @section, @assignment )
  end
end
