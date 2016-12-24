require 'test_helper'

class Admin::SyllabusPartsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/syllabus_parts', {},
                        {action: 'create'}   => :post,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
    # session[:referrer] = "blah"
  end

  test "should create syllabus part" do
    session[:referrer] = 'test.com'

    assert_difference('SyllabusPart.count') do
      post admin_syllabus_parts_url,
        params: {
          course_id: courses(:intro_to_jackassery).id,
          syllabus_part: {
            name: "Something",
            title: "Something",
            description: "something blah"
          }
        }
    end

    assert_not_nil assigns(:syllabus_part)

    assert_redirected_to admin_course_policies_url(assigns(:course))
  end

  test "should get edit" do
    get edit_admin_syllabus_part_url(syllabus_parts(:one), course_id: courses(:intro_to_jackassery).id)
    assert_response :success
  end

  test "should update syllabus part" do
    put admin_syllabus_part_url(syllabus_parts(:one)),
        params: {
          course_id: courses(:intro_to_jackassery).id,
          syllabus_part: { 
            title: 'blah blah' 
          }
        }

    assert_redirected_to admin_course_policies_url(assigns(:course))
  end

  test "should destroy syllabus part" do
    assert_difference('SyllabusPart.count', -1) do
      delete admin_syllabus_part_url(syllabus_parts(:one), course_id: courses(:intro_to_jackassery).id)
    end

    # assert_redirected_to session[:referrer]
    assert_redirected_to admin_syllabus_parts_url
  end
end
