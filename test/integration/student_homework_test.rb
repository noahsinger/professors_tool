require 'test_helper'

class StudentHomeworkTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "valid student can submit a lab solution" do
    section = sections(:jck1003_section_1)
    semester = section.semester
    assignment = section.assignments.first
    student = section.enrollments.first.student
    
    visit new_semester_section_assignment_work_path(semester,section,assignment)
    fill_in("Email", :with => students(:stew).email)
    attach_file("Upload", "#{fixture_path}/files/file.zip")
    
    assert_difference("Work.count") do
      click_on("Upload")
    end
    
    assert_equal students(:stew).enrollments.first, Work.last.enrollment
    assert_equal students(:stew).email, Work.last.email
    
    assert_equal semester_section_assignment_path(semester,section,assignment), current_path
    assert page.has_content?("Your work was successfully uploaded.")
  end
  
  test "invalid student can submit lab solution" do
    section = sections(:jck1003_section_1)
    semester = section.semester
    assignment = section.assignments.first
    student = section.enrollments.first.student
    
    visit new_semester_section_assignment_work_path(semester,section,assignment)
    fill_in("Email", :with => xxx@xxx.xxx
    attach_file("Upload", "#{fixture_path}/files/file.zip")
    
    assert_difference("Work.count") do
      click_on("Upload")
    end
    
    assert_equal nil, Work.last.enrollment
    assert_equal xxx@xxx.xxx Work.last.email
    
    assert_equal semester_section_assignment_path(semester,section,assignment), current_path
    assert page.has_content?("Your work was successfully uploaded.")
  end
end
