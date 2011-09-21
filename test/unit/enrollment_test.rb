require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  test "enrollments exist" do
    assert_equal 2, Enrollment.count
  end
  
  test "enrollments have letter grades" do
    assert_respond_to Enrollment.find(1), :current_grade
    assert_equal 'A', Enrollment.find(1).current_grade
  end
  
  test "enrollments have a current average" do
    assert_respond_to Enrollment.find(1), :current_average
    assert_equal 100, Enrollment.find(1).current_average
  end

  test "enrollments know their current points" do
    assert_respond_to Enrollment.find(1), :current_points
    assert_equal 100, Enrollment.find(1).current_points
  end
end
