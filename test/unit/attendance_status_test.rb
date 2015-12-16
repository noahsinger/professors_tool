require 'test_helper'

class AttendanceStatusTest < ActiveSupport::TestCase
	test "attendance statuses exist" do
    assert_equal 4, AttendanceStatus.count
  end
  
  test "attendnace status shortcut class methods are dynamically generated" do
    assert_equal AttendanceStatus.find_by_name("present"), AttendanceStatus.present
    test_status = AttendanceStatus.create :name => "test_status"
    assert_equal test_status, AttendanceStatus.test_status
  end
end
