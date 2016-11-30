require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  test "assignments exist" do
    assert_equal 2, Assignment.count
  end
  
  test "assignments calculate their worth" do
    assert_respond_to Assignment.first, :worth
    assert_equal 100, Assignment.find(1).worth
  end
  
  test "assignments can find their average score" do
    assert_respond_to Assignment.first, :average
    assert_equal 100, Assignment.find(1).average
  end
  
  test "assignments know if they are overdue" do
    assert_respond_to Assignment.first, :overdue?
    assert_equal true, Assignment.find(1).overdue?
  end
  
  test "assignments know if their works have been graded or not" do
    assert_respond_to Assignment.first, :graded?
    assert_equal true, Assignment.find(1).graded?
    assert_equal false, Assignment.find(2).graded?
  end
  
  test "assignment class should return visible assignments" do
    assert_respond_to Assignment, :visible
    assert_equal 2, Assignment.visible.size
  end
  
  test "assignments can be seen as ical events" do
    assert_respond_to Assignment.first, :to_ical_event
  end
end
