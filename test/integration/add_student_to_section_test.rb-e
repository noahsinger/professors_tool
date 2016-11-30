require 'test_helper'

class AddStudentToSectionTest < ActionDispatch::IntegrationTest
  test "add new student to section" do
  	User.create(username: 'user', password: 'test', password_confirmation: 'test')
    
    # login as admin
    visit login_path
    
    fill_in("Username", with: 'user')
    fill_in("Password", with: 'test')
    click_on("Sign in")    
    
    # add new student
    visit new_admin_semester_section_enrollment_path( semesters(:fall), sections(:jck1003_section_2) )
    
    fill_in("email", with: xxx@xxx.xxx
    click_on("Enroll")
    
    assert_equal new_admin_semester_section_student_path( semesters(:fall), sections(:jck1003_section_2) ), current_path
    
    assert page.has_selector?( 'input[id=student_first_name][value=Noah]' )
    assert page.has_selector?( 'input[id=student_last_name][value=Singer]' )
    assert page.has_selector?( xxx@xxx.xxx )
    
    click_on( "Create" )
    
    assert_equal admin_semester_section_path( semesters(:fall), sections(:jck1003_section_2) ), current_path
  end
end
