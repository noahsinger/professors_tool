require 'test_helper'

class EnrollmentStatusTest < ActiveSupport::TestCase
  test "enrollment statuses exist" do
    assert_equal 3, EnrollmentStatus.count
  end
  
  test "enrollment status shortcut class methods are dynamically generated" do
    assert_respond_to EnrollmentStatus, :dropped
    assert_equal EnrollmentStatus.find_by_name("dropped"), EnrollmentStatus.dropped
    test_status = EnrollmentStatus.create :name => "test_status"
    assert_equal test_status, EnrollmentStatus.test_status
  end
end
