require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test "students exist" do
    assert_equal 3, Student.count
  end
  
  test "students respond to last name first" do
    assert_respond_to Student.first, :last_name_first
    assert_equal "#{students(:stew).last_name}, #{students(:stew).first_name} #{students(:stew).middle_name}", students(:stew).last_name_first
  end
  
  test "students resond to first name first" do
    assert_respond_to Student.first, :first_name_first
    assert_equal "#{students(:stew).first_name} #{students(:stew).middle_name} #{students(:stew).last_name}", students(:stew).first_name_first
  end
end
