require 'test_helper'

class AddSyllabusPartTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "new syllabus part can be added" do
    
    User.create(:username => 'user', :password => 'test', :password_confirmation => 'test')
    
    # login as admin
    visit login_path
    
    fill_in("Username", :with => 'user')
    fill_in("Password", :with => 'test')
    click_on("Sign in")    
    
    # try to add syllabus part
    course = Course.all.first
    visit admin_course_policies_path( course )
    
    fill_in("syllabus_part_name", :with => "Test Part")
    fill_in("syllabus_part_title", :with => "Test Policy")
    fill_in("syllabus_part_description", :with => "This is a policy to be")
    
    click_on("Add")
    
    part = SyllabusPart.find_by_name( "Test Part" );
    
    assert page.has_content?("Test Part")
  end
end
