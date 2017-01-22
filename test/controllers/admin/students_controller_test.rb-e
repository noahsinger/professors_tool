require 'test_helper'

class Admin::StudentsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/students', {},
                        {action: 'index'}    => :get,
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'show', id: 1}     => :get,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
  end

  test "should get index" do
    get admin_students_url
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get new_admin_semester_section_student_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1))
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post admin_semester_section_students_url(sections(:jck1003_section_1).semester,sections(:jck1003_section_1)),
        params: {
          student: {
            first_name: "Something",
            last_name: "Something",
            email: xxx@xxx.xxx
          }
        }
    end

    assert_not_nil assigns(:enrollment)
    assert_equal assigns(:student).id, assigns(:enrollment).student_id
    assert_equal sections(:jck1003_section_1).id, assigns(:enrollment).section_id

    assert_redirected_to admin_semester_section_enrollments_path(assigns(:semester),assigns(:section))
  end

  test "should show student" do
    get admin_student_url(students(:stew))
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_student_url(students(:stew))
    assert_response :success
  end

  test "should update student" do
    put admin_student_url(students(:stew)),
      params: {student: { first_name: 'blah blah' }}
    assert_redirected_to admin_student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete admin_student_path(students(:stew))
    end

    assert_redirected_to admin_students_path
  end
end
