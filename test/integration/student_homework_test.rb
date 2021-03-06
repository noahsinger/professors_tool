require 'test_helper'

class StudentHomeworkTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "valid student can submit a lab solution" do
    logout
    session[:user_id] = nil
    if page.has_selector?( 'a[href="/logout"]' )
      click_on("Signout")
    end

    section = sections(:jck1003_section_1)
    semester = section.semester
    assignment = section.assignments.first
    student = section.enrollments.first.student

    visit new_semester_section_assignment_work_path(semester,section,assignment)
    fill_in("work_email", with: students(:stew).email)
    attach_file("work_upload", "#{fixture_path}/files/file.zip")

    assert_difference("Work.count") do
      click_on("Submit Solution")
    end

    assert_equal students(:stew).enrollments.first, Work.last.enrollment
    assert_equal students(:stew).email, Work.last.email

    assert_equal semester_section_assignment_path(semester,section,assignment), current_path
    assert page.has_content?("Your work was successfully uploaded.")
  end

  test "invalid student can submit lab solution" do
    logout
    session[:user_id] = nil
    if page.has_selector?( 'a[href="/logout"]' )
      click_on("Signout")
    end

    section = sections(:jck1003_section_1)
    semester = section.semester
    assignment = section.assignments.first
    student = section.enrollments.first.student

    visit new_semester_section_assignment_work_path(semester,section,assignment)
    fill_in("work_email", with: "unknown@test.com")
    attach_file("work_upload", "#{fixture_path}/files/file.zip")

    assert_difference("Work.count") do
      click_on("Submit Solution")
    end

    assert_nil Work.last.enrollment
    assert_equal "unknown@test.com", Work.last.email

    assert_equal semester_section_assignment_path(semester,section,assignment), current_path
    assert page.has_content?("Your work was successfully uploaded.")
  end
end
