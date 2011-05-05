require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  fixtures :courses
  
  def test_create
    assert_equal Course.count, 2
  end
  
  def test_short_name
    assert_equal Course.find( 1 ).short_name, courses(:intro_to_jackassery).discipline + courses(:intro_to_jackassery).number
  end
  
  def test_invalid
    course = Course.new
    course.valid?
    assert_equal course.errors.size, 5
  end
end
