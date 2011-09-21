require 'test_helper'

class EnrollmentStatusTest < ActiveSupport::TestCase
  test "enrollment statuses exist" do
    assert_equal 3, EnrollmentStatus.count
  end
end
