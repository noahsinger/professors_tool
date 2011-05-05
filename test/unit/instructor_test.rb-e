require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
  fixtures :instructors
  
  def test_create
    assert_equal Instructor.count, 2
  end
  
  def test_valid
    i = Instructor.new
    i.valid?
    assert_equal i.errors.size, 5
  end
  
  def test_has_division
    assert_equal instructors(:me).division.id, 1
  end
end
