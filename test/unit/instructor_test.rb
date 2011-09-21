require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
  def test_create
    assert_equal 2, Instructor.count
  end
  
  def test_valid
    i = Instructor.new
    i.valid?
    assert_equal 5, i.errors.size
  end
  
  def test_has_division
    assert_equal 1, instructors(:me).division.id
  end
  
  test "instructors respond to full_name" do
    assert_respond_to Instructor.first, :full_name
    assert_equal "Assistant Professor Noah Singer", Instructor.find(1).full_name
  end
  
  test "instructors respond to name" do
    assert_respond_to Instructor.first, :name
    assert_equal "Noah Singer", Instructor.find(1).name
  end
end
